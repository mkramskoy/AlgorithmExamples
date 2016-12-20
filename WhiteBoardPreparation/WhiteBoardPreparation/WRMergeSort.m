//
//  WRMergeSort.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/20/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import "WRMergeSort.h"


@implementation WRMergeSort

+ (void)run {
    
    NSArray *array = @[@18, @3, @1, @2, @8, @11, @9, @3, @7];
 
    NSLog(@"%@", [array wr_sortedByMerge]);
}

@end


@implementation NSArray(MergeSort)

- (NSArray*)wr_sortedByMerge {
    
    if (self.count == 1) {
        return self;
    }
    
    NSUInteger size = self.count/2;
    NSArray *leftPart = [self subarrayWithRange:NSMakeRange(0, size)];
    NSArray *rightPart = [self subarrayWithRange:NSMakeRange(size, self.count - size)];
    
    NSArray *sortedLeftPart = [leftPart wr_sortedByMerge];
    NSArray *sortedRightPart = [rightPart wr_sortedByMerge];
    
    return [self wr_mergeArray:sortedLeftPart with:sortedRightPart];
}

- (NSArray*)wr_mergeArray:(NSArray*)firstArray with:(NSArray*)secondArray {
    
    NSMutableArray *resultArray = [NSMutableArray new];
    
    int i = 0;
    int j = 0;
    
    while ( i < firstArray.count && j < secondArray.count ) {
        if ( [firstArray[i] integerValue] < [secondArray[j] integerValue] ) {
            [resultArray addObject:firstArray[i]];
            i++;
        }
        else {
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
