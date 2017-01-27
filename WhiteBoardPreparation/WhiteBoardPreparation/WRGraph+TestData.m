//
//  WRGraph+TestData.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 1/27/17.
//  Copyright © 2017 Connector. All rights reserved.
//

#import "WRGraph+TestData.h"

@implementation WRGraph (TestData)

+ (WRGraph*)smallCaseWithCycle {
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
    
    return graph;
}

@end
