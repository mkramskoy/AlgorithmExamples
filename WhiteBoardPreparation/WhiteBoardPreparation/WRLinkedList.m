//
//  WRLinkedList.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/6/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import "WRLinkedList.h"

@implementation WRNode

- (instancetype)initWithValue:(id)value {
    
    self = [super init];
    
    if ( self ) {
        self.value = value;
    }
    
    return self;
}

@end


@implementation WRLinkedList

- (WRLinkedList*)initWithHead:(WRNode*)node {
    
    self = [super init];
    
    if ( self ) {
        self.head = node;
    }
    
    return self;
}

- (void)push:(id)object {
    
    WRNode *node = [WRNode new];
    node.value = object;
    node.next = self.head;
    
    self.head = node;
}

- (id)pop {
    
    NSNumber *valueToReturn = self.head.value;
    self.head = self.head.next;
    
    return valueToReturn;
}

- (id)peek {
    
    return self.head.value;
}

- (NSString*)description {
    
    NSMutableString *desc = [NSMutableString new];
    WRNode *node = self.head;
    while (node) {
        [desc appendString:[NSString stringWithFormat:@"%@ ", node.value]];
        node = node.next;
    }
    
    return desc;
}

@end


