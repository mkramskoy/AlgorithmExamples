//
//  WRStackWithMaxNumber.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 11/24/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import "WRStackWithMaxNumber.h"
#import "WRLinkedList.h"

@interface WRMaxNumberStack()

@property (nonatomic, strong) WRLinkedList *list;
@property (nonatomic, strong) WRLinkedList *maxValueList;

@end


@implementation WRMaxNumberStack

- (id)init {
    
    self = [super init];
    
    if (self) {
        self.list = [WRLinkedList new];
        self.maxValueList = [WRLinkedList new];
    }
    
    return self;
}

- (void)addObject:(NSNumber*)object {
    
    [self.list push:object];
    
    if ( self.maxValueList.head != nil ) {
        NSInteger currentMax = ((NSNumber*)self.maxValueList.head.value).integerValue;
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


@implementation WRStackWithMaxNumber

+ (void)run {
    
    WRMaxNumberStack *stack = [WRMaxNumberStack new];
    
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
