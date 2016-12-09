//
//  WRAnagram.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/9/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import "WRAnagram.h"

@implementation WRAnagram

+ (void)run {
    
    NSString *str1 = @"bar";
    NSString *str2 = @"rab";
    NSLog(@"Words: %@ %@ are anagrams: %@", str1, str2, [self isAnagram:str1 toWord:str2] ? @"YES" : @"NO");
    
    str1 = @"ar";
    str2 = @"rab";
    NSLog(@"Words: %@ %@ are anagrams: %@", str1, str2, [self isAnagram:str1 toWord:str2] ? @"YES" : @"NO");
    
    str1 = @"basdfr";
    str2 = @"rafdsb";
    NSLog(@"Words: %@ %@ are anagrams: %@", str1, str2, [self isAnagram:str1 toWord:str2] ? @"YES" : @"NO");
}

+ (BOOL)isAnagram:(NSString*)str1 toWord:(NSString*)str2 {
    
    str1 = [str1 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    str2 = [str2 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if ( str1.length != str2.length ) {
        return NO;
    }
    
    NSCountedSet *str1Set = [NSCountedSet new];
    NSCountedSet *str2Set = [NSCountedSet new];
    
    for (int i = 0; i < str1.length; i++) {
        [str1Set addObject:@([str1 characterAtIndex:i])];
        [str2Set addObject:@([str2 characterAtIndex:i])];
    }
    
    return [str1Set isEqual:str2Set];
}

@end
