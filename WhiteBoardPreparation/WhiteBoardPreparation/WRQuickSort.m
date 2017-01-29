//
//  WRQuickSort.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/20/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import "WRQuickSort.h"
#import "NSArray+TestData.h"
#include <stdlib.h>

@implementation WRQuickSort

+ (void)run {
    NSMutableArray *integers = [[NSArray oneHundredSubsequentIntegers] mutableCopy];
    [integers wr_sortByQuickSort];
    
    NSLog(@"%@", integers);
}

@end

@implementation NSMutableArray (WRQuickSort)

- (void)wr_sortByQuickSort {
    [self wr_sortByQuickSortInRange:NSMakeRange(0, self.count) pivotChoice:WRPivotChoiceMedian];
}

- (void)wr_sortByQuickSortInRange:(NSRange)range pivotChoice:(WRQuickSortPivotChoice)pivotChoice {
    if ( range.length <= 1 ) {
        return;
    }
    
    NSUInteger pivot = [self choosePivot:pivotChoice inRange:range];
    NSLog(@"pivot = %lu\n", pivot);
    
    pivot = [self partitionAroundPivot:pivot range:range];
    
    [self wr_sortByQuickSortInRange:NSMakeRange(range.location, pivot - range.location) pivotChoice:pivotChoice];
    [self wr_sortByQuickSortInRange:NSMakeRange(pivot + 1, range.length + range.location - pivot - 1) pivotChoice:pivotChoice];
}

- (NSUInteger)choosePivot:(WRQuickSortPivotChoice)pivotChoice inRange:(NSRange)range  {
    switch (pivotChoice) {
        case WRPivotChoiceFirst: {
            return range.location;
        }
        case WRPivotChoiceRandom: {
            NSUInteger a = arc4random_uniform((uint32_t)range.length);;
            
            return range.location + a;
        }
        case WRPivotChoiceMedian: {
            NSInteger firstElement = [self[range.location] integerValue];
            NSInteger middleElement = [self[range.location + (range.length - 1)/2] integerValue];
            NSInteger lastElement = [self[range.location + range.length - 1] integerValue];
            
            NSInteger median = MAX(MIN(firstElement, middleElement), MIN(MAX(firstElement, middleElement), lastElement));
            if ( median == firstElement ) {
                return range.location;
            }
            else if ( median == middleElement ) {
                return range.location + (range.length - 1)/20;
            }
            else {
                return range.location + range.length - 1;
            }
        }
    }
}

- (NSUInteger)partitionAroundPivot:(NSUInteger)pivot range:(NSRange)range {
    [self exchangeObjectAtIndex:pivot withObjectAtIndex:range.location];
    
    NSUInteger pivotPosition = range.location;
    NSInteger pivotValue = [self[pivotPosition] integerValue];
    
    NSUInteger k = pivotPosition + 1;
    while ( k < range.location + range.length ) {
        NSInteger currentValue = [self[k] integerValue];
        
        if ( currentValue <= pivotValue ) {
            pivotPosition++;
            [self exchangeObjectAtIndex:pivotPosition withObjectAtIndex:k];
        }
        
        k++;
    }
    
    [self exchangeObjectAtIndex:range.location withObjectAtIndex:pivotPosition];
    
    return pivotPosition;
}

@end

