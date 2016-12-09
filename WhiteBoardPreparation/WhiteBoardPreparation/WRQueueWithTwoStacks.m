//
//  WRQueueWithTwoStacks.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 11/18/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import "WRQueueWithTwoStacks.h"

@interface Stack: NSObject

- (void)add:(id)object;
- (id)pop;
- (id)peek;

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation Stack

- (id)init {
    
    self = [super init];
    
    if ( self ) {
        self.array = [NSMutableArray array];
    }
    
    return self;
}

- (void)add:(id)object {
    
    [self.array addObject:object];
}

- (id)pop {
    
    if (self.array.count == 0) {
        return nil;
    }
    else {
        id objectToReturn = self.array[self.array.count-1];
        [self.array removeLastObject];
        
        return objectToReturn;
    }
}

- (id)peek {
    
    if (self.array.count == 0) {
        return nil;
    }
    else {
        return self.array[self.array.count-1];
    }
}

@end

@interface Queue : NSObject

- (void)add:(id)object;
- (id)pop;
- (id)peek;

@property(nonatomic, strong) Stack *stack1;
@property(nonatomic, strong) Stack *stack2;

@end

@implementation Queue

- (id)init {
    
    self = [super init];
    
    if ( self ) {
        self.stack1 = [[Stack alloc] init];
        self.stack2 = [[Stack alloc] init];
    }
    
    return self;
}


- (void)add:(id)object {
    
    [self.stack1 add:object];
}

- (id)pop {
    
    if ( self.stack2.array.count == 0 ) {
        while ( self.stack1.array.count != 0 ) {
            [self.stack2 add:[self.stack1 pop]];
        }
    }
    
    id objectToReturn = [self.stack2 pop];
    
    return objectToReturn;
}

- (id)peek {
    
    if ( self.stack2.array.count == 0 ) {
        while ( self.stack1.array.count != 0 ) {
            [self.stack2 add:[self.stack1 pop]];
        }
    }
    
    id objectToReturn = [self.stack2 peek];
    
    return objectToReturn;
}

@end

@implementation WRQueueWithTwoStacks

+ (void)run {
    
    Queue *queue = [[Queue alloc] init];
    
    [queue add:@42];
    [queue pop];
    [queue add:@14];
    NSLog(@"%@", [queue peek]);
    [queue add:@28];
    NSLog(@"%@", [queue peek]);
    [queue add:@60];
    [queue add:@78];
    [queue pop];
    [queue pop];
    
}


@end
