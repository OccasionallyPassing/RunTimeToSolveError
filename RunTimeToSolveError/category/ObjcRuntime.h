//
//  ObjcRuntime.h
//  RunTimeToSolveError
//
//  Created by apple on 17/1/23.
//  Copyright © 2017年 Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface ObjcRuntime : NSObject

extern void YFSwizzleMethod(Class cls, SEL originalSelector, SEL swizzledSelector);

@end
