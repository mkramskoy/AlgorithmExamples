//
//  WRQueue.h
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 1/27/17.
//  Copyright © 2017 Connector. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WRQueue : NSObject

- (id)pop;
- (void)push:(id)object;
- (id)peek;
- (BOOL)isEmpty;

@end
