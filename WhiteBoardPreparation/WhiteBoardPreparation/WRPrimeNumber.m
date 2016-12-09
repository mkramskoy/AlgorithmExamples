//
//  WRPrimeNumber.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/9/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import "WRPrimeNumber.h"

@implementation WRPrimeNumber

+ (void)run {
    
    NSUInteger number = 1;
    NSLog(@"Number %lu is prime: %@\n", number, [self isPrimeNumber:number] ? @"true" : @"false");
    number = 2;
    NSLog(@"Number %lu is prime: %@\n", number, [self isPrimeNumber:number] ? @"true" : @"false");
    number = 3;
    NSLog(@"Number %lu is prime: %@\n", number, [self isPrimeNumber:number] ? @"true" : @"false");
    number = 7;
    NSLog(@"Number %lu is prime: %@\n", number, [self isPrimeNumber:number] ? @"true" : @"false");
    number = 12;
    NSLog(@"Number %lu is prime: %@\n", number, [self isPrimeNumber:number] ? @"true" : @"false");
    number = 1123423562;
    NSLog(@"Number %lu is prime: %@\n", number, [self isPrimeNumber:number] ? @"true" : @"false");
}

+ (BOOL)isPrimeNumber:(NSUInteger)number {
    
    BOOL result = YES;
    if ( number == 1 ) {
        result = NO;
    }
    else if ( number != 2 && number % 2 == 0) {
        result = NO;
    }
    else {
        for ( int i=3; i<=sqrt(number); i=i+2) {
            if ( number%i == 0 ) {
                result = NO;
            }
        }
    }
        
    return result;
}

@end
