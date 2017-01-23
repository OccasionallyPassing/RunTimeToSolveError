//
//  NSArray+NSRangeException.m
//  RunTimeToSolveError
//
//  Created by apple on 17/1/23.
//  Copyright © 2017年 Wang. All rights reserved.
//

#import "NSArray+NSRangeException.h"
#import "ObjcRuntime.h"

@implementation NSArray (NSRangeException)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            Class class0 = objc_getClass("__NSArray0");
            Class classI = objc_getClass("__NSSingleObjectArrayI");
            Class classM = objc_getClass("__NSArrayM");
            YFSwizzleMethod(class0, @selector(objectAtIndex:), @selector(YF_emptyObjectIndex:));
            YFSwizzleMethod(classI, @selector(objectAtIndex:), @selector(YF_arrObjectIndex:));
            YFSwizzleMethod(classM, @selector(objectAtIndex:), @selector(YF_mutableObjectIndex:));
            YFSwizzleMethod(classM, @selector(insertObject:atIndex:), @selector(YF_mutableInsertObject:atIndex:));
        }
    });
}

- (id)YF_emptyObjectIndex:(NSInteger)index{
    return nil;
}

- (id)YF_arrObjectIndex:(NSInteger)index{
    if (index >= self.count || index < 0) {
        return nil;
    }
    return [self YF_arrObjectIndex:index];
}

- (id)YF_mutableObjectIndex:(NSInteger)index{
    if (index >= self.count || index < 0) {
        return nil;
    }
    return [self YF_mutableObjectIndex:index];
}

- (void)YF_mutableInsertObject:(id)object atIndex:(NSUInteger)index{
    if (object) {
        [self YF_mutableInsertObject:object atIndex:index];
    }
}

@end
