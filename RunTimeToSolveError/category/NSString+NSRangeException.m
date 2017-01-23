//
//  NSString+NSRangeException.m
//  RunTimeToSolveError
//
//  Created by apple on 17/1/23.
//  Copyright © 2017年 Wang. All rights reserved.
//

#import "NSString+NSRangeException.h"
#import "ObjcRuntime.h"

@implementation NSString (NSRangeException)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            Class class = objc_getClass("__NSCFConstantString");
            YFSwizzleMethod(class, @selector(objectForKeyedSubscript:), @selector(YF_objectForKeyedSubscript:));
        }
    });
}

- (id)YF_objectForKeyedSubscript:(NSString *)key {
    return nil;
}

@end
