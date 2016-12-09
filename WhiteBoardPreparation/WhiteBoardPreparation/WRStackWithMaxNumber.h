//
//  WRStackWithMaxNumber.h
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 11/24/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WRMaxNumberStack: NSObject

- (void)addObject:(NSNumber*)object;
- (NSNumber*)pop;
- (NSNumber*)peek;
- (NSNumber*)maxNumber;

@end


@interface WRStackWithMaxNumber: NSObject

+ (void)run;

@end





