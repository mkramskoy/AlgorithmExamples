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
        NSUInteger index = [array binarySearchForObject:@(i)];
        
        if ( index != i ) {
            NSLog(@"AAAA!");
        }
    }
}

@end

@implementation NSArray(BinarySearch)

- (NSUInteger)binarySearchForObject:(NSNumber*)number {
    
    return [self binarySearchForObject:number inRange:NSMakeRange(0, self.count)];
}

- (NSUInteger)binarySearchForObject:(NSNumber*)number inRange:(NSRange)range {
    
    NSInteger lowerBound = range.location;
    NSInteger upperBound = range.location + range.length - 1;
    
    while (upperBound - lowerBound >= 0) {
        NSUInteger centerIndex = lowerBound + (upperBound - lowerBound)/2;
        NSUInteger centerValue = [[self objectAtIndex:centerIndex] integerValue];
        if ( number.integerValue == centerValue ) {
            return centerIndex;
        }
        else if ( number.integerValue < centerValue ) {
            upperBound = centerValue - 1;
        }
        else {
            lowerBound = centerValue + 1;
        }
    }
    
    return NSNotFound;
}

@end
