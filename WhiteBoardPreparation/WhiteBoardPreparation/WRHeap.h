//
//  WRHeap.h
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/12/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, WRHeapType) {
    WRHeapTypeMax,
    WRHeapTypeMin
};

@interface WRHeap : NSObject

@property (nonatomic, readonly) WRHeapType type;

- (instancetype)initWithType:(WRHeapType)type;
- (instancetype)initWithType:(WRHeapType)type array:(NSArray*)array;

- (void)add:(NSNumber*)number;
- (NSNumber*)popExtremum;
- (NSNumber*)peekExtremum;
- (BOOL)isEmpty;
- (NSUInteger)count;

@end
