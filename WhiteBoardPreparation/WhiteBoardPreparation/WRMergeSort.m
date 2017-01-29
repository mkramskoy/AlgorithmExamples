//
//  WRMergeSort.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/20/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import "WRMergeSort.h"
#import "WRMergeSort+CStyle.h"
#import "NSArray+TestData.h"

@implementation WRMergeSort

+ (void)run {
    
    //NSArray *integers = @[@2, @1, @3, @1, @2];
    NSArray *integers = [NSArray oneHundredSubsequentIntegers];
    NSInteger inverseCount = 0;
    
    NSLog(@"%@", [integers wr_sortedByMergeCountingInverse:&inverseCount]);
    NSLog(@"inverseCount = %lu", inverseCount);
}

@end


@implementation NSArray(MergeSort)

- (NSArray*)wr_sortedByMerge {
    return [self wr_sortedByMergeCountingInverse:nil];
}

- (NSArray*)wr_sortedByMergeCountingInverse:(NSInteger *)inverseCount {
    if (self.count <= 1) {
        return self;
    }
    
    NSUInteger size = self.count/2;
    NSArray *leftPart = [self subarrayWithRange:NSMakeRange(0, size)];
    NSArray *rightPart = [self subarrayWithRange:NSMakeRange(size, self.count - size)];
    
    NSArray *sortedLeftPart = [leftPart wr_sortedByMergeCountingInverse:inverseCount];
    NSArray *sortedRightPart = [rightPart wr_sortedByMergeCountingInverse:inverseCount];
    
    return [self wr_mergeArray:sortedLeftPart with:sortedRightPart inverseCount:inverseCount];
}

- (NSArray*)wr_mergeArray:(NSArray*)firstArray with:(NSArray*)secondArray inverseCount:(NSInteger *)inverseCount {
    NSMutableArray *resultArray = [NSMutableArray new];
    
    int i = 0;
    int j = 0;
    
    while ( i < firstArray.count && j < secondArray.count ) {
        if ( [firstArray[i] integerValue] < [secondArray[j] integerValue] ) {
            [resultArray addObject:firstArray[i]];
            i++;
        }
        else if ( [firstArray[i] integerValue] > [secondArray[j] integerValue] ) {
            [resultArray addObject:secondArray[j]];
            j++;
            if ( inverseCount ) {
                *inverseCount += firstArray.count - i;
            }
        }
        else {
            [resultArray addObject:firstArray[i]];
            i++;
            [resultArray addObject:secondArray[j]];
            j++;
        }
    }
    
    while ( i < firstArray.count ) {
        [resultArray addObject:firstArray[i]];
        i++;
    }
    
    while ( j < secondArray.count ) {
        [resultArray addObject:secondArray[j]];
        j++;
    }
    
    return resultArray;
}


@end


