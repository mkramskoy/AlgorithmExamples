//
//  WRShortesPathBFS.h
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 1/27/17.
//  Copyright © 2017 Connector. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WRGraph.h"
#import "WRLinkedList.h"

@interface WRGraph (WRShortestPathBFS)

- (WRLinkedList*)shortestPathFrom:(WRVertex*)from to:(WRVertex*)to;

@end

@interface WRShortesPathBFS : NSObject

+ (void)run;

@end
