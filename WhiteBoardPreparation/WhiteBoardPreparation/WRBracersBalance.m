//
//  WRBracersBalance.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 11/15/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import "WRBracersBalance.h"

@implementation WRBracersBalance


+ (void)run {

    NSString *string = @"{([])()()}{([])}";

    NSLog(@"%@", [self isWRBracersBalanced:string] ? @"YES" : @"NO");
}

+ (BOOL)isWRBracersBalanced:(NSString*)string {
    
    NSSet *leftBracers = [[NSSet alloc] initWithArray:@[@"{", @"(", @"["]];
    NSDictionary *accordanceMap = @{ @"}" : @"{", @"]": @"[", @")" : @"("};
    
    NSMutableArray *stack = [[NSMutableArray alloc] init];
    
    for ( int i=0; i<string.length; i++) {
        NSString *brace = [string substringWithRange:NSMakeRange(i, 1)];
        if ( [leftBracers containsObject:brace] ) {
            [stack addObject: brace];
        }
        else {
            if ( stack.count == 0 ) {
                return NO;
                break;
            }
            
            NSString *lastLeftBrace = [stack objectAtIndex:stack.count-1];
            if ( ![accordanceMap[brace] isEqualToString:lastLeftBrace] ) {
                return NO;
                break;
            }
            
            [stack removeLastObject];
        }
        
    }
    
    if (stack.count != 0) {
        return NO;
    }
    
    return YES;
}

@end
