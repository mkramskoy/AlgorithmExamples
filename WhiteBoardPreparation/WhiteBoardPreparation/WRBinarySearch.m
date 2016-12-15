//
//  WRBinarySearch.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/13/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import "WRBinarySearch.h"

@implementation WRBinarySearch

+ (void)run {
    
    NSArray *array = @[@0, @1, @2, @3, @4, @5, @6, @7, @8, @9];
    
//    NSUInteger index = [array indexOfObject:@4 inSortedRange:NSMakeRange(0, array.count) options:NSBinarySearchingFirstEqual usingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
//        return [obj1 compare:obj2];
//    }];
//    
//    NSLog(@"Index using native method = %lu", index);
    
    for ( int i = 0; i < array.count; i++) {
        NSUInteger index = [self indexOfObject:@(i) inSortedArray:array];
        
        if ( index != i ) {
            NSLog(@"AAAA!");
        }
    }
}

+ (NSUInteger)indexOfObject:(NSNumber*)number inSortedArray:(NSArray*)array {
    
    NSUInteger lowerBound = 0;
    NSUInteger upperBound = array.count;
    
    while (upperBound-lowerBound > 1) {
        NSUInteger center = lowerBound + (upperBound - lowerBound)/2;
        if ( number.integerValue < [array[center] integerValue] ) {
            upperBound = center;
        }
        else {
            lowerBound = center;
        }
    }
    
    return lowerBound;
}


@end
