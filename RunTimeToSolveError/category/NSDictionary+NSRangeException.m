//
//  NSDictionary+NSRangeException.m
//  RunTimeToSolveError
//
//  Created by apple on 17/1/23.
//  Copyright © 2017年 Wang. All rights reserved.
//

#import "NSDictionary+NSRangeException.h"
#import "ObjcRuntime.h"

@implementation NSDictionary (NSRangeException)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = NSClassFromString(@"__NSPlaceholderDictionary");
        YFSwizzleMethod(class, @selector(initWithObjects:forKeys:count:), @selector(YF_initWithObjects:forKeys:count:));
        YFSwizzleMethod(class, @selector(dictionaryWithObjects:forKeys:count:), @selector(YF_dictionaryWithObjects:forKeys:count:));
    });
}

+ (instancetype)YF_dictionaryWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt {
    id safeObjects[cnt];
    id safeKeys[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        id key = keys[i];
        id obj = objects[i];
        if (!key) {
            continue;
        }
        if (!obj) {
            obj = [NSNull null];
        }
        safeKeys[j] = key;
        safeObjects[j] = obj;
        j++;
    }
    return [self YF_dictionaryWithObjects:safeObjects forKeys:safeKeys count:j];
}

- (instancetype)YF_initWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt {
    id safeObjects[cnt];
    id safeKeys[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        id key = keys[i];
        id obj = objects[i];
        if (!key) {
            continue;
        }
        if (!obj) {
            obj = [NSNull null];
        }
        safeKeys[j] = key;
        safeObjects[j] = obj;
        j++;
    }
    return [self YF_initWithObjects:safeObjects forKeys:safeKeys count:j];
}

@end

@implementation NSMutableDictionary (NSRangeException)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = NSClassFromString(@"__NSDictionaryM");
        YFSwizzleMethod(class, @selector(setObject:forKey:), @selector(YF_setObject:forKey:));
        YFSwizzleMethod(class, @selector(setObject:forKeyedSubscript:), @selector(YF_setObject:forKeyedSubscript:));
    });
}

- (void)YF_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    if (!aKey) {
        return;
    }
    if (!anObject) {
        anObject = [NSNull null];
    }
    [self YF_setObject:anObject forKey:aKey];
}

- (void)YF_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key {
    if (!key) {
        return;
    }
    if (!obj) {
        obj = [NSNull null];
    }
    [self YF_setObject:obj forKeyedSubscript:key];
}

@end

@implementation NSNull (NSRangeException)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        YFSwizzleMethod(self, @selector(methodSignatureForSelector:), @selector(YF_methodSignatureForSelector:));
        YFSwizzleMethod(self, @selector(forwardInvocation:), @selector(YF_forwardInvocation:));
    });
}

- (NSMethodSignature *)YF_methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *sig = [self YF_methodSignatureForSelector:aSelector];
    if (sig) {
        return sig;
    }
    return [NSMethodSignature signatureWithObjCTypes:@encode(void)];
}

- (void)YF_forwardInvocation:(NSInvocation *)anInvocation {
    NSUInteger returnLength = [[anInvocation methodSignature] methodReturnLength];
    if (!returnLength) {
        // nothing to do
        return;
    }
    
    // set return value to all zero bits
    char buffer[returnLength];
    memset(buffer, 0, returnLength);
    
    [anInvocation setReturnValue:buffer];
}

@end
