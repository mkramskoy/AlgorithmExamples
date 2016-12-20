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

@property (nonatomic, strong) WRHeap *maxHeap; // left part
@property (nonatomic, strong) WRHeap *minHeap; // right part

@end

@implementation WRRunningMedian

+ (void)run {
    
    WRRunningMedian *median = [WRRunningMedian new];
    
//    [median addNumber:@12];
//    [median addNumber:@4];
//    [median addNumber:@5];
//    [median addNumber:@3];
//    [median addNumber:@8];
//    [median addNumber:@7];
    
    NSURL *fileURL = [[NSBundle bundleForClass:[self class]] URLForResource:@"Median" withExtension:@"txt"];
    
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:fileURL encoding:NSUTF8StringEncoding error:&error];
    if ( error ) {
        NSLog(@"error reading file");
    }
    
    __block NSUInteger medianSumModulo = 0;
    __block NSUInteger counter = 0;
    [string enumerateLinesUsingBlock:^(NSString * _Nonnull line, BOOL * _Nonnull stop) {
        [median addNumber:@([line integerValue])];
        NSUInteger currentMedian = [[median calculateMedian] integerValue];
        medianSumModulo = (medianSumModulo + currentMedian);
        counter++;
    }];
    
    NSLog(@"Median Sum Modulo = %lu", medianSumModulo % 10000);
}

- (instancetype)init {
    
    self = [super init];
    
    if ( self ) {
        self.maxHeap = [[WRHeap alloc] initWithType:WRHeapTypeMax]; // left part
        self.minHeap = [[WRHeap alloc] initWithType:WRHeapTypeMin]; // right part
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
    else {
        return self.maxHeap.peekExtremum;
    }
}

@end
