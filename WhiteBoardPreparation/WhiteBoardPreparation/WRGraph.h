//
//  WRGraph.h
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 1/22/17.
//  Copyright © 2017 Connector. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WREdge;

@interface WRVertex : NSObject

@property (nonatomic, readwrite) BOOL visited;
@property (nonatomic, strong, readonly) NSString *label;
@property (nonatomic, strong, readonly) NSArray<WREdge *> *edges;

- (instancetype)initWithLabel:(NSString*)label;
- (WREdge*)addEdgeTo:(WRVertex*)to;

@end


@interface WREdge : NSObject

@property (nonatomic, strong, readonly) WRVertex *from;
@property (nonatomic, strong, readonly) WRVertex *to;
@property (nonatomic, readonly) NSInteger weight;

- (instancetype)initWithFrom:(WRVertex*)from to:(WRVertex*)to weight:(NSInteger)weight;
- (instancetype)initWithFrom:(WRVertex*)from to:(WRVertex*)to;

@end


@interface WRGraph : NSObject

@property (nonatomic, strong, readonly) NSArray<WRVertex *> *vertices;

- (void)addVertex:(WRVertex*)vertex;

@end
