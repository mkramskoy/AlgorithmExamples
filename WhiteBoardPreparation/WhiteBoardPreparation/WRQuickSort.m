//
//  WRQuickSort.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/20/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import "WRQuickSort.h"
#include <stdlib.h>

@implementation WRQuickSort

+ (void)run {
    
    NSMutableArray *integers = [@[@4, @80, @70, @23, @9, @60, @68, @27, @66, @78, @12, @40, @52, @53, @44, @8, @49, @28, @18, @46, @21, @39, @51, @7, @87, @99, @69, @62, @84, @6, @79, @67, @14, @98, @83, @0, @96, @5, @82, @10, @26, @48, @3, @2, @15, @92, @11, @55, @63, @97, @43, @45, @81, @42, @95, @20, @25, @74, @24, @72, @91, @35, @86, @19, @75, @58, @71, @47, @76, @59, @64, @93, @17, @50, @56, @94, @90, @89, @32, @37, @34, @65, @1, @73, @41, @36, @57, @77, @30, @22, @13, @29, @38, @16, @88, @61, @31, @85, @33, @54] mutableCopy];
    
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

