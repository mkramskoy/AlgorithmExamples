//
//  WRBinarySearch.h
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/13/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray(BinarySearch)

- (NSUInteger)binarySearchForObject:(NSNumber*)number inRange:(NSRange)range;
- (NSUInteger)binarySearchForObject:(NSNumber*)number;

@end

@interface WRBinarySearch : NSObject

+ (void)run;

@end
