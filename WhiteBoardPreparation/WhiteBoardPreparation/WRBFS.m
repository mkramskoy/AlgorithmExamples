//
//  WRBFS.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 1/22/17.
//  Copyright © 2017 Connector. All rights reserved.
//

#import "WRBFS.h"
#import "WRGraph.h"
#import "WRGraph+TestData.h"

@implementation WRBFS

+ (void)run {
    WRGraph *graph = [WRGraph smallCaseWithCycle];

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
