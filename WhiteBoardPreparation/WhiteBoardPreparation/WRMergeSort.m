//
//  WRMergeSort.m
//  WhiteBoardPreparation
//
//  Created by Michael Kramskoy on 12/20/16.
//  Copyright © 2016 Connector. All rights reserved.
//

#import "WRMergeSort.h"


@implementation WRMergeSort

+ (void)run {
    
    NSURL *fileURL = [[NSBundle bundleForClass:[self class]] URLForResource:@"IntegerArray" withExtension:@"txt"];
    
    NSError *error = nil;
    NSString *string = [NSString stringWithContentsOfURL:fileURL encoding:NSUTF8StringEncoding error:&error];
    if ( error ) {
        NSLog(@"error reading file");
    }
    
//    NSMutableArray *integers = [NSMutableArray new];
//    [string enumerateLinesUsingBlock:^(NSString * _Nonnull line, BOOL * _Nonnull stop) {
//        [integers addObject:@([line integerValue])];
//    }];
    
    NSArray *integers = @[@2, @1, @3, @1, @2];
    
    //NSArray *integers = @[@4, @80, @70, @23, @9, @60, @68, @27, @66, @78, @12, @40, @52, @53, @44, @8, @49, @28, @18, @46, @21, @39, @51, @7, @87, @99, @69, @62, @84, @6, @79, @67, @14, @98, @83, @0, @96, @5, @82, @10, @26, @48, @3, @2, @15, @92, @11, @55, @63, @97, @43, @45, @81, @42, @95, @20, @25, @74, @24, @72, @91, @35, @86, @19, @75, @58, @71, @47, @76, @59, @64, @93, @17, @50, @56, @94, @90, @89, @32, @37, @34, @65, @1, @73, @41, @36, @57, @77, @30, @22, @13, @29, @38, @16, @88, @61, @31, @85, @33, @54];
    
    NSInteger inverseCount = 0;
    
    NSLog(@"%@", [integers wr_sortedByMergeCountingInverse:&inverseCount]);
    NSLog(@"inverseCount = %lu", inverseCount);
}

@end


@implementation NSArray(MergeSort)

- (NSArray*)wr_sortedByMerge {
    
    return [self wr_sortedByMergeCountingInverse:nil];
}

- (NSArray*)wr_sortedByMergeCountingInverse:(NSInteger *)inverseCount {
    
    if (self.count <= 1) {
        return self;
    }
    
    NSUInteger size = self.count/2;
    NSArray *leftPart = [self subarrayWithRange:NSMakeRange(0, size)];
    NSArray *rightPart = [self subarrayWithRange:NSMakeRange(size, self.count - size)];
    
    NSArray *sortedLeftPart = [leftPart wr_sortedByMergeCountingInverse:inverseCount];
    NSArray *sortedRightPart = [rightPart wr_sortedByMergeCountingInverse:inverseCount];
    
    return [self wr_mergeArray:sortedLeftPart with:sortedRightPart inverseCount:inverseCount];
}

- (NSArray*)wr_mergeArray:(NSArray*)firstArray with:(NSArray*)secondArray inverseCount:(NSInteger *)inverseCount {
    
    NSMutableArray *resultArray = [NSMutableArray new];
    
    int i = 0;
    int j = 0;
    
    while ( i < firstArray.count && j < secondArray.count ) {
        if ( [firstArray[i] integerValue] < [secondArray[j] integerValue] ) {
            [resultArray addObject:firstArray[i]];
            i++;
        }
        else if ( [firstArray[i] integerValue] > [secondArray[j] integerValue] ) {
            [resultArray addObject:secondArray[j]];
            j++;
            if ( inverseCount ) {
                *inverseCount += firstArray.count - i;
            }
        }
        else {
            [resultArray addObject:firstArray[i]];
            i++;
            [resultArray addObject:secondArray[j]];
            j++;
        }
    }
    
    while ( i < firstArray.count ) {
        [resultArray addObject:firstArray[i]];
        i++;
    }
    
    while ( j < secondArray.count ) {
        [resultArray addObject:secondArray[j]];
        j++;
    }
    
    return resultArray;
}

@end
