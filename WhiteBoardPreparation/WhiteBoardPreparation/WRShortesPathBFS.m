//
//  WRShortesPathBFS.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 1/27/17.
//  Copyright © 2017 Connector. All rights reserved.
//

#import "WRShortesPathBFS.h"
#import "WRGraph.h"
#import "WRGraph+TestData.h"
#import "WRLinkedList.h"
#import "WRLinkedListReverse.h"
#import "WRQueue.h"

@implementation WRShortesPathBFS

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
    
    WRLinkedList *path = [graph shortestPathFrom:vertexE to:vertexA];
    NSLog(@"%@", [path description]);
}

@end


typedef WRNode WRPath;

@implementation WRGraph (WRShortestPathBFS)

- (WRLinkedList*)shortestPathFrom:(WRVertex*)from to:(WRVertex*)to {
    if ( !from || !to ) { return nil; }
    
    WRQueue *queue = [WRQueue new];
    WRQueue *pathQueue = [WRQueue new];
    
    WRPath *path = [[WRPath alloc] initWithValue:from];
    
    from.visited = YES;
    [queue push:from];
    [pathQueue push:path];
    
    while ( !queue.isEmpty ) {
        WRVertex *vertex = [queue pop];
        WRPath *pathNode = [pathQueue pop];
        
        for (WREdge *edge in vertex.edges) {
            WRVertex *neighbour = edge.to;
            if (!neighbour.visited) {
                WRNode *pathToNeighbour = [[WRNode alloc] initWithValue:neighbour];
                pathToNeighbour.next = pathNode;
                
                if (neighbour == to) {
                    WRLinkedList *list = [[WRLinkedList alloc] initWithHead:pathToNeighbour];
                    [list reverse];
                    return list;
                }
                else {
                    neighbour.visited = YES;
                    [queue push:neighbour];
                    [pathQueue push:pathToNeighbour];
                }
            }
        }
    }
    
    return nil;
}

@end
