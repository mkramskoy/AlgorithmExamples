//
//  StackWithMaxNumber.h
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 11/24/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node: NSObject

@property (nonatomic, strong) Node *next;
@property (nonatomic, strong) NSNumber *value;

@end


@interface LinkedList: NSObject

@property (nonatomic, strong) Node *head;

- (void)push:(NSNumber*)object;
- (NSNumber*)pop;
- (NSNumber*)peek;

@end


@interface MaxNumberStack: NSObject

- (void)addObject:(NSNumber*)object;
- (NSNumber*)pop;
- (NSNumber*)peek;
- (NSNumber*)maxNumber;

@end


@interface StackWithMaxNumber: NSObject

+ (void)run;

@end





