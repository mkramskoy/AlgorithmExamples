//
//  NSArray+TestData.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 1/29/17.
//  Copyright © 2017 Connector. All rights reserved.
//

#import "NSArray+TestData.h"

@implementation NSArray (TestData)

+ (NSArray*)oneHundredSubsequentIntegers {
    NSArray *integers = @[@4, @80, @70, @23, @9, @60, @68, @27, @66, @78, @12, @40, @52, @53, @44, @8, @49, @28, @18, @46, @21, @39, @51, @7, @87, @99, @69, @62, @84, @6, @79, @67, @14, @98, @83, @0, @96, @5, @82, @10, @26, @48, @3, @2, @15, @92, @11, @55, @63, @97, @43, @45, @81, @42, @95, @20, @25, @74, @24, @72, @91, @35, @86, @19, @75, @58, @71, @47, @76, @59, @64, @93, @17, @50, @56, @94, @90, @89, @32, @37, @34, @65, @1, @73, @41, @36, @57, @77, @30, @22, @13, @29, @38, @16, @88, @61, @31, @85, @33, @54];
    
    return integers;
}

+ (NSArray*)tenThousandSubsequentIntegers {
    NSURL *fileURL = [[NSBundle bundleForClass:[self class]] URLForResource:@"IntegerArray" withExtension:@"txt"];

    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:fileURL encoding:NSUTF8StringEncoding error:&error];
    if ( error ) {
        NSLog(@"error reading file");
    }

    NSMutableArray *integers = [NSMutableArray new];
    [string enumerateLinesUsingBlock:^(NSString * _Nonnull line, BOOL * _Nonnull stop) {
        [integers addObject:@([line integerValue])];
    }];
    
    return integers;
}

@end