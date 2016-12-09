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
    
    __unused NSInteger result1 = [self indexOfSubstring:@"ABC" inParent:@"MNABCOP"];
    __unused NSInteger result2 = [self indexOfSubstring:@"ABC" inParent:@"FDABABC"];
    __unused NSInteger result3 = [self indexOfSubstring:@"AB" inParent:@"BA"];
}


+ (NSInteger)indexOfSubstring:(NSString*)string inParent:(NSString*)parent {
    
    if ( string == nil || string.length > parent.length ) {
        return -1;
    }
    
    for ( int i=0; i<parent.length; i++ ) {
        if ( [self stringExists:string atIndex:i inParent:parent] ) {
            return i;
        }
    }
    
    return -1;
}

+ (BOOL)stringExists:(NSString*)string atIndex:(NSInteger)index inParent:(NSString*)parent {
    
    if ( string.length + index > parent.length ) {
        return NO;
    }
    
    if ( [string characterAtIndex:0] != [parent characterAtIndex:index] ||
         [string characterAtIndex:string.length-1] != [parent characterAtIndex:index+string.length-1] ) {
        return NO;
    }
    
    int charsMatched = 2;
    for ( int j = 1; j<string.length-1; j++ ) {
        unichar charInParent = [parent characterAtIndex:index+j];
        unichar charInChild = [string characterAtIndex:j];
        
        if (charInParent == charInChild) {
            charsMatched++;
        }
        else {
            break;
        }
        
        if ( charsMatched == string.length ) {
            return YES;
        }
    }
    
    return NO;
}


@end
