//
//  WRSubstringExistsInParent.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/2/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import "WRSubstringExistsInParent.h"

@implementation WRSubstringExistsInParent

+ (void)run {
    __unused NSInteger result1 = [@"AA" wr_indexOfSubstring:@"A"];
    __unused NSInteger result2 = [@"BA" wr_indexOfSubstring:@"AB"];
    __unused NSInteger result3 = [@"AB" wr_indexOfSubstring:@"AB"];
    __unused NSInteger result4 = [@"AaAB" wr_indexOfSubstring:@"AB"];
    __unused NSInteger result5 = [@"MNABCOP" wr_indexOfSubstring:@"ABC"];
    __unused NSInteger result6 = [@"FDABABC" wr_indexOfSubstring:@"ABC"];
}

@end

@implementation NSString(WRIndexOfSubstring)

- (NSUInteger)wr_indexOfSubstring:(NSString*)substring {
    if (!substring || substring.length == 0) {
        return NSNotFound;
    }

    for (NSUInteger index=0; index < self.length-substring.length+1; index++) {
        if ( [self wr_containsSubstring:substring atIndex:index] ) {
            return index;
        }
    }
    
    return NSNotFound;
}

- (BOOL)wr_containsSubstring:(NSString*)substring atIndex:(NSUInteger)index {
    unichar firstLetter = [self characterAtIndex:index];
    unichar lastLetter = [self characterAtIndex:index+substring.length - 1];
    
    if (firstLetter != [substring characterAtIndex:0] ||
        lastLetter != [substring characterAtIndex:substring.length-1]) {
        return NO;
    }
    
    for (NSUInteger j=1; j < substring.length - 1; j++) {
        unichar currentLetter = [self characterAtIndex:index+j];
        if (currentLetter != [substring characterAtIndex:j]) {
            return NO;
        }
    }
    
    return YES;
}

@end
