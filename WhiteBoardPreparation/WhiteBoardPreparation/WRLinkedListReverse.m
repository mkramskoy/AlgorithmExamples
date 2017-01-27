//
//  WRLinkedListReverse.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/6/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import "WRLinkedListReverse.h"
#import "WRLinkedList.h"

@implementation WRLinkedList(Reverse)

- (void)reverse {
    [self reverseFromIndex:0];
}

- (void)reverseFromIndex:(NSUInteger)index {
    WRNode *node;
    WRNode *current;
    if ( index == 0 ) {
        node = self.head;
        current = node;
    }
    else {
        node = [self nodeAtIndex:index-1];
        current = node.next;
    }
    
    WRNode *previous = nil;
    
    while ( current ) {
        
        WRNode *next = current.next;
        
        current.next = previous;
        
        previous = current;
        current = next;
    }
    
    if ( index == 0 ) {
        self.head = previous;
    }
    else {
        node.next = previous;
    }
}

- (WRNode*)nodeAtIndex:(NSUInteger)index {
    WRNode *currentNode = self.head;
    NSUInteger currentIndex = 0;
    
    while ( currentNode ) {
        if ( currentIndex == index ) {
            return currentNode;
        }
        
        currentNode = currentNode.next;
        currentIndex++;
    }
    
    return currentNode;
}

@end


@implementation WRLinkedListReverse

+ (void)run {
    WRNode *node5 = [[WRNode alloc] initWithValue:@"5"];
    node5.next = nil;
    WRNode *node4 = [[WRNode alloc] initWithValue:@"4"];
    node4.next = node5;
    WRNode *node3 = [[WRNode alloc] initWithValue:@"3"];
    node3.next = node4;
    WRNode *node2 = [[WRNode alloc] initWithValue:@"2"];
    node2.next = node3;
    WRNode *node1 = [[WRNode alloc] initWithValue:@"1"];
    node1.next = node2;
    
    WRLinkedList *list = [[WRLinkedList alloc] initWithHead:node1];
    
    NSLog(@"WRLinkedListReverse original list: %@\n", [list description]);
    [list reverse];
    NSLog(@"reversed: %@", [list description]);
    
}

@end
