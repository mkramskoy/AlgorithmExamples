//
//  WRGraph.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 1/22/17.
//  Copyright © 2017 Connector. All rights reserved.
//

#import "WRGraph.h"

@interface WRVertex()

@property (nonatomic, strong, readwrite) NSString *label;
@property (nonatomic, strong, readwrite) NSMutableArray<WREdge *> *edges;

@end

@implementation WRVertex

- (instancetype)initWithLabel:(NSString*)label {
    self = [super init];
    if (self) {
        self.visited = NO;
        self.label = label;
        self.edges = [NSMutableArray new];
    }
    return self;
}

- (WREdge*)addEdgeTo:(WRVertex*)to {
    WREdge *edge = [[WREdge alloc] initWithFrom:self to:to];
    [(NSMutableArray*)self.edges addObject:edge];
    return edge;
}

@end

@interface WREdge()

@property (nonatomic, strong, readwrite) WRVertex *from;
@property (nonatomic, strong, readwrite) WRVertex *to;
@property (nonatomic, readwrite) NSInteger weight;

@end

@implementation WREdge

- (instancetype)initWithFrom:(WRVertex*)from to:(WRVertex*)to weight:(NSInteger)weight {
    self = [self initWithFrom:from to:to];
    if (self) {
        self.weight = weight;
    }
    
    return self;
}

- (instancetype)initWithFrom:(WRVertex*)from to:(WRVertex*)to {
    self = [super init];
    if (self) {
        self.from = from;
        self.to = to;
        self.weight = 1;
    }
    return self;
}

@end

@interface WRGraph()

@property (nonatomic, strong, readwrite) NSMutableArray <WRVertex *> *vertices;

@end

@implementation WRGraph

- (instancetype)init {
    self = [super init];
    if ( self ) {
        self.vertices = [NSMutableArray new];
    }
    return self;
}

- (void)addVertex:(WRVertex *)vertex {
    [(NSMutableArray*)self.vertices addObject:vertex];
}

@end


