//
//  WRSubstringExistsInParent.h
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/2/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(WRIndexOfSubstring)

- (NSUInteger)wr_indexOfSubstring:(NSString*)substring;

@end

@interface WRSubstringExistsInParent : NSObject

+ (void)run;

@end
