//
//  StackWithMaxNumber.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 11/24/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import "StackWithMaxNumber.h"

@implementation Node

@end

@implementation LinkedList

- (void)push:(NSNumber*)object {
    
    Node *node = [Node new];
    node.value = object;
    node.next = self.head;
    
    self.head = node;
}

- (NSNumber*)pop {
    
    NSNumber *valueToReturn = self.head.value;
    self.head = self.head.next;
    
    return valueToReturn;
}

- (NSNumber*)peek {
    
    return self.head.value;
}

@end

@interface MaxNumberStack()

@property (nonatomic, strong) LinkedList *list;
@property (nonatomic, strong) LinkedList *maxValueList;

@end


@implementation MaxNumberStack

- (id)init {
    
    self = [super init];
    
    if (self) {
        self.list = [LinkedList new];
        self.maxValueList = [LinkedList new];
    }
    
    return self;
}

- (void)addObject:(NSNumber*)object {
    
    [self.list push:object];
    
    if ( self.maxValueList.head != nil ) {
        NSInteger currentMax = self.maxValueList.head.value.integerValue;
        if ( currentMax < object.integerValue ) {
            [self.maxValueList push:object];
        }
        else {
            [self.maxValueList push:@(currentMax)];
        }
    }
    else {
        [self.maxValueList push:object];
    }
}

- (NSNumber*)pop {
    
    NSNumber *numberToReturn = [self.list pop];
    [self.maxValueList pop];
    
    return numberToReturn;
}

- (NSNumber*)peek {
    
    return [self.list peek];
}

- (NSNumber*)maxNumber {
    
    return [self.maxValueList peek];
}


@end


@implementation StackWithMaxNumber

+ (void)run {
    
    MaxNumberStack *stack = [MaxNumberStack new];
    
    [stack addObject:@3];
    [stack addObject:@1];
    [stack addObject:@2];
    [stack addObject:@6];
    [stack addObject:@0];
    [stack addObject:@7];
    [stack addObject:@4];
    
    NSLog(@"max value = %@", [stack maxNumber] );
}


@end
