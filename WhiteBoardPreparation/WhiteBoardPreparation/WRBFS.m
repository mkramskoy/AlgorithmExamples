//
//  WRBFS.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 1/22/17.
//  Copyright © 2017 Connector. All rights reserved.
//

#import "WRBFS.h"
#import "WRGraph.h"

@implementation WRBFS

+ (void)run {
    WRGraph *graph = [WRGraph new];
    
    WRVertex *vertexA = [[WRVertex alloc] initWithLabel:@"A"];
    [graph addVertex:vertexA];
    WRVertex *vertexB = [[WRVertex alloc] initWithLabel:@"B"];
    [graph addVertex:vertexB];
    WRVertex *vertexC = [[WRVertex alloc] initWithLabel:@"C"];
    [graph addVertex:vertexC];
    WRVertex *vertexD = [[WRVertex alloc] initWithLabel:@"D"];
    [graph addVertex:vertexD];
    WRVertex *vertexE = [[WRVertex alloc] initWithLabel:@"E"];
    [graph addVertex:vertexE];
    
    [vertexA addEdgeTo:vertexB];
    [vertexB addEdgeTo:vertexE];
    [vertexC addEdgeTo:vertexE];
    [vertexD addEdgeTo:vertexB];
    [vertexE addEdgeTo:vertexD];
    
    NSLog(@"BFS count = %lu", [graph breadthFirstSearchFromVertex:nil]);
}

@end

@implementation WRGraph (BFS)

- (NSInteger)breadthFirstSearchFromVertex:(WRVertex*)vertex {
    if (!vertex) {
        return -1;
    }
    
    NSMutableArray *queue = [NSMutableArray new];
    
    [queue addObject:vertex];
    vertex.visited = YES;
    
    NSInteger counter = 1;
    
    while (queue.count != 0) {
        WRVertex *current = queue[0];
        [queue removeObjectAtIndex:0];
        
        for (WREdge *edge in current.edges) {
            WRVertex *edgeEnd = edge.to;
            if (!edgeEnd.visited) {
                edgeEnd.visited = YES;
                [queue addObject:edgeEnd];
                
                counter++;
            }
        }
    }
    
    return counter;
}

@end
