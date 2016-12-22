//
//  WRQuickSort.h
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/20/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WRQuickSort : NSObject

+ (void)run;

@end


typedef NS_ENUM(NSUInteger, WRQuickSortPivotChoice) {
    WRPivotChoiceFirst,
    WRPivotChoiceRandom,
    WRPivotChoiceMedian,
};

@interface NSArray(WRQuickSort)

- (void)wr_sortByQuickSort;

@end
