//
//  WRHeap.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/12/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import "WRHeap.h"

@interface WRHeap()

@property (nonatomic, readwrite) WRHeapType type;
@property (nonatomic, strong) NSMutableArray *array;

@end


@implementation WRHeap

- (instancetype)initWithType:(WRHeapType)type; {
    
    self = [super init];
    
    if (self) {
        
        self.type = type;
        self.array = [NSMutableArray new];
    }
    
    return self;
}

- (instancetype)initWithType:(WRHeapType)type array:(NSArray*)array {
    
    self = [self initWithType:type];
    
    if (self) {
        
        self.array = [array mutableCopy];
        
        for ( NSInteger i = self.array.count/2 + 1; i > 0; i--) {
            [self heapifyUp:i];
        }
    }
    
    return self;
}

- (void)add:(NSNumber*)number {
    
    [self.array addObject:number];
    
    [self heapifyUp:self.array.count - 1];
}

- (NSNumber*)popExtremum {
    
    [self.array exchangeObjectAtIndex:0 withObjectAtIndex:self.array.count-1];
    
    NSNumber *extremum = self.array.lastObject;
    [self.array removeLastObject];
    
    [self heapifyDown:0];
    
    return extremum;
}

- (NSNumber*)peekExtremum {
    
    return [self.array firstObject];
}

- (BOOL)isEmpty {
    
    return self.array.count == 0;
}

- (NSUInteger)count {
    
    return self.array.count;
}

#pragma mark - Private
- (void)heapifyUp:(NSInteger)index {
    
    NSInteger childIndex = index;
    NSInteger parentIndex = [self parentIndex:index];
    
    while ( parentIndex >= 0 && [self isInWrongOrder:self.array[parentIndex] child:self.array[childIndex]] ) {
        
        [self.array exchangeObjectAtIndex:childIndex withObjectAtIndex:parentIndex];
        
        childIndex = parentIndex;
        parentIndex = [self parentIndex:childIndex];
    }
}

- (void)heapifyDown:(NSInteger)index {
    
    NSInteger parent = index;
    
    while ( true ) {
        NSInteger leftChild = [self leftChildIndex:parent];
        NSInteger rightChild = [self rightChildIndex:parent];
        
        NSInteger first = parent;
        if ( leftChild < self.array.count && [self isInWrongOrder:self.array[first] child:self.array[leftChild]] ) {
            first = leftChild;
        }
        if ( rightChild < self.array.count && [self isInWrongOrder:self.array[first] child:self.array[rightChild]] ) {
            first = rightChild;
        }
        
        if ( first == parent ) {
            break;
        }
        else {
            [self.array exchangeObjectAtIndex:parent withObjectAtIndex:first];
            parent = first;
        }
    }
}

- (BOOL)isInWrongOrder:(NSNumber*)parent child:(NSNumber*)child {
    
    switch (self.type) {
        case WRHeapTypeMax:
            return parent.integerValue < child.integerValue;
            
        case WRHeapTypeMin:
            return parent.integerValue > child.integerValue;
    }
}

- (NSInteger)parentIndex:(NSInteger)child {
    
    return roundf((child - 1)/2);
}

- (NSInteger)leftChildIndex:(NSInteger)parent {
    
    return (parent*2 + 1);
}

- (NSInteger)rightChildIndex:(NSInteger)parent {
    
    return (parent*2 + 2);
}

@end


