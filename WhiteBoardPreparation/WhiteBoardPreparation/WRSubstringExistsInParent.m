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
    
    __unused NSInteger result1 = [@"MNABCOP" indexOfSubstring:@"ABC"];
    __unused NSInteger result2 = [@"FDABABC" indexOfSubstring:@"ABC"];
    __unused NSInteger result3 = [@"BA" indexOfSubstring:@"AB"];
    __unused NSInteger result4 = [@"AB" indexOfSubstring:@"AB"];
    __unused NSInteger result5 = [@"AaAB" indexOfSubstring:@"AB"];
}

@end

@implementation NSString(WRIndexOfSubstring)

- (NSUInteger)indexOfSubstring:(NSString*)substring {
    
    if ( !substring || substring.length > self.length ) {
        return NSNotFound;
    }
    
    for ( int i=0; i < self.length - substring.length + 1; i++) {
        unichar firstLetter = [self characterAtIndex:i];
        unichar lastLetter = [self characterAtIndex:i+substring.length-1];
        
        if ( firstLetter == [substring characterAtIndex:0] && lastLetter == [substring characterAtIndex:substring.length - 1] ) {
            BOOL mismatchFound = NO;
            for ( int j=1; j<substring.length-1; j++) {
                if ( [self characterAtIndex:i+j] != [substring characterAtIndex:j] ) {
                    mismatchFound = YES;
                }
            }
            
            if ( !mismatchFound ) {
                return i;
            }
        }
    }
    
    return NSNotFound;
}

@end
