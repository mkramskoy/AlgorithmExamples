//
//  WRQueue.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 1/27/17.
//  Copyright © 2017 Connector. All rights reserved.
//

#import "WRQueue.h"

@interface WRQueue ()

@property (nonatomic, strong) NSMutableArray *array;

@end


@implementation WRQueue

- (instancetype)init {
    self = [super init];
    if (self) {
        self.array = [NSMutableArray new];
    }
    
    return self;
}

- (id)pop {
    if (!self.isEmpty) {
        id object = [self.array firstObject];
        [self.array removeObjectAtIndex:0];
        return object;
    }

    return nil;
}

- (void)push:(id)object {
    [self.array addObject:object];
}

- (id)peek {
    return [self.array firstObject];
}

- (BOOL)isEmpty {
    return self.array.count == 0;
}

@end
