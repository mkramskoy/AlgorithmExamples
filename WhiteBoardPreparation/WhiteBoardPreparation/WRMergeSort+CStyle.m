//
//  WRMergeSort+CStyle.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 1/29/17.
//  Copyright © 2017 Connector. All rights reserved.
//

#import "WRMergeSort+CStyle.h"

@implementation WRMergeSort (CStyle)

long mergeHalves(int arr[], int temp[], int leftStart, int rightEnd) {
    
    long swaps = 0;
    int leftEnd = (leftStart + rightEnd) / 2;
    int rightStart = leftEnd + 1;
    int l = leftStart;
    int r = rightStart;
    
    NSLog(@"Merging two arrays, first right element: %i,\n", arr[r]);
    for (int i = leftStart; i <= rightEnd; i++) {
        NSLog(@"%i", arr[i]);
    }
    
    //we only add to swap when a right element is copied because if it was a left element, then it either didn't move to was swapped with something on the right.
    
    for (int i = leftStart; i <= rightEnd; i++) {
        if (l > leftEnd) {  //ran out of lefts to merge in, so just copy the next element from right
            temp[i] = arr[r];
            //NSLog(@"xx %d\n", abs(r - i));
            swaps += abs(r - i);
            r++;
        }
        else if (r > rightEnd) {  //ran out of rights to merge in, so just copy the next element from left
            temp[i] = arr[l];
            l++;
        }
        else if (arr[l] <= arr[r]) { //left element is next
            temp[i] = arr[l];
            l++;
        }
        else {  //right element is next
            temp[i] = arr[r];
            swaps += abs(r - i);
            NSLog(@"yy %d\n", abs(r - i));
            r++;
        }
    }
    
    //now copy it all back to arr
    for (int i = leftStart; i <= rightEnd; i++) {
        arr[i] = temp[i];
    }
    
    return swaps;
}

long mergeSortH(int arr[], int temp[], int left, int right) {
    
    if (left >= right) {
        return 0;
    }
    
    int mid = (left + right) / 2;
    long swaps = 0;
    
    swaps += mergeSortH(arr, temp, left, mid);
    swaps += mergeSortH(arr, temp, mid+1, right);
    swaps += mergeHalves(arr, temp, left, right);
    
    return swaps;
}

long mergeSort(int arr[], int length) {
    
    int temp[length];
    return mergeSortH(arr, temp, 0, length - 1);
}

@end
