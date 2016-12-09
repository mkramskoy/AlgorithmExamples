//
//  WRLinkedList.h
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/6/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WRNode: NSObject

@property (nonatomic, strong) WRNode *next;
@property (nonatomic, strong) id value;

- (instancetype)initWithValue:(id)value;

@end

@interface WRLinkedList: NSObject

@property (nonatomic, strong) WRNode *head;

- (WRLinkedList*)initWithHead:(WRNode*)node;

- (void)push:(id)object;
- (id)pop;
- (id)peek;

@end
