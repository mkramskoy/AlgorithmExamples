//
//  WRBinarySearchInString.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/15/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import "WRBinarySearchInString.h"

@implementation WRBinarySearchInString

+ (void)run {
    
    NSString *string = @"0123456789";
    
    for ( int i=0; i<string.length; i++) {
        unichar character = [string characterAtIndex:i];
        NSInteger index = [self binarySearchInString:string forChar:character];
        
        if ( index != i ) {
            NSLog(@"AAAA!");
        }
    }
}

+ (NSInteger)binarySearchInString:(NSString*)string forChar:(unichar)character {
    
    NSString *temp = [NSString stringWithFormat:@"%C", character];
    NSInteger charIntValue = [temp intValue];
    
    NSInteger low = 0;
    NSInteger high = string.length - 1;
    
    while ( high >= low ) {
        
        NSInteger middle = low + (high - low)/2;
        NSString *middleChar = [NSString stringWithFormat:@"%C", [string characterAtIndex:middle]];
        NSInteger middleCharIntValue = [middleChar integerValue];
        
        if ( [string characterAtIndex:middle] == character ) {
            return middle;
        }
        else if ( charIntValue < middleCharIntValue ) {
            high = middle - 1;
        }
        else {
            low = middle + 1;
        }
    }
    
    return NSNotFound;
}

@end



