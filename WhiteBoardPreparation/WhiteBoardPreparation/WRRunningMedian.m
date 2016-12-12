//
//  WRRunningMedian.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/12/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import "WRRunningMedian.h"
#import "WRHeap.h"

@interface WRRunningMedian()

@property (nonatomic, strong) WRHeap *maxHeap;
@property (nonatomic, strong) WRHeap *minHeap;

@end

@implementation WRRunningMedian

+ (void)run {
    
    WRRunningMedian *median = [WRRunningMedian new];
    
    [median addNumber:@12];
    [median addNumber:@4];
    [median addNumber:@5];
    [median addNumber:@3];
    [median addNumber:@8];
    [median addNumber:@7];
}

- (instancetype)init {
    
    self = [super init];
    
    if ( self ) {
        self.maxHeap = [[WRHeap alloc] initWithType:WRHeapTypeMax];
        self.minHeap = [[WRHeap alloc] initWithType:WRHeapTypeMin];
    }
    
    return self;
}

- (void)addNumber:(NSNumber*)number {
    
    NSNumber *rightPartMin = [self.minHeap peekExtremum];
    
    if ( self.minHeap.count == 0 && self.maxHeap.count == 0 ) {
        [self.maxHeap add:number];
    }
    else if ( rightPartMin && number.integerValue >= rightPartMin.integerValue ) {
        [self.minHeap add:number];
    }
    else {
        [self.maxHeap add:number];
    }
    
    [self balanceHeaps];
    
    NSLog(@"New median is %@\n", [self calculateMedian]);
}

- (void)balanceHeaps {
    
    if ( self.minHeap.count - self.maxHeap.count == 2 ) {
        [self.maxHeap add:[self.minHeap popExtremum]];
    }
    
    if ( self.maxHeap.count - self.minHeap.count == 2 ) {
        [self.minHeap add:[self.maxHeap popExtremum]];
    }
}

- (NSNumber*)calculateMedian {
    
    if ( self.minHeap.count > self.maxHeap.count ) {
        return self.minHeap.peekExtremum;
    }
    else if ( self.maxHeap.count > self.minHeap.count ) {
        return self.maxHeap.peekExtremum;
    } else {
        return [NSNumber numberWithFloat:(self.minHeap.peekExtremum.floatValue + self.maxHeap.peekExtremum.floatValue)/2.f];
    }
}

@end
