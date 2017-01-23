//
//  WRBFS.h
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 1/22/17.
//  Copyright © 2017 Connector. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WRGraph.h"

@interface WRBFS : NSObject

+ (void)run;

@end

@interface WRGraph (BFS)

- (NSInteger)breadthFirstSearchFromVertex:(WRVertex*)vertex;

@end
