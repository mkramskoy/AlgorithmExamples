//
//  WR2SumProblem.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/17/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import "WR2SumProblem.h"

@implementation WR2SumProblem

+ (void)run {
    NSURL *fileURL = [[NSBundle bundleForClass:[self class]] URLForResource:@"2sum" withExtension:@"txt"];
    
    
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:fileURL encoding:NSUTF8StringEncoding error:&error];
    if ( error ) {
        NSLog(@"error reading file");
    }
    
    NSMutableSet *set = [NSMutableSet new];
    [string enumerateLinesUsingBlock:^(NSString * _Nonnull line, BOOL * _Nonnull stop) {
        [set addObject:@([line integerValue])];
    }];

    NSLog(@"Start");
    
    NSInteger counter = 0;
    for ( NSInteger sum=-10000; sum<=10000; sum++ ) {
        if ( [self lookForSum:sum inSet:set] ) {
            counter++;
        }
    }
    
    NSLog(@"Finished, number = %@", @(counter));
}

+ (BOOL)lookForSum:(NSInteger)sum inSet:(NSSet*)set {
    
    for ( NSNumber *number in set ) {
        NSNumber *numberToFind = @(sum - number.integerValue);
        
        if ( ![number isEqualToNumber:numberToFind] && [set containsObject:numberToFind] ) {
            return YES;
        }
    }
    
    return NO;
}

@end
