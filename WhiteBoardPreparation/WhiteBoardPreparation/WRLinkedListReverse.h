//
//  WRLinkedListReverse.h
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/6/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WRLinkedList.h"

@interface WRLinkedList(Reverse)

- (void)reverse;

@end

@interface WRLinkedListReverse : NSObject

+ (void)run;

@end
