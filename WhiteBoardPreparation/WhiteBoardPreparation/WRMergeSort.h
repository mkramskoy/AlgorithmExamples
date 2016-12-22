//
//  WRMergeSort.h
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/20/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray(MergeSort)

- (NSArray*)wr_sortedByMerge;
- (NSArray*)wr_sortedByMergeCountingInverse:(NSInteger *)inverseCount;

@end


@interface WRMergeSort: NSObject

+ (void)run;

@end
