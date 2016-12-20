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

@end


@interface WRMergeSort: NSObject

+ (void)run;

@end
