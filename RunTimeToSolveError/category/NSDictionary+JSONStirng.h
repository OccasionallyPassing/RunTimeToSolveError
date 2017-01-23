//
//  NSDictionary+JSONStirng.h
//  RunTimeToSolveError
//
//  Created by apple on 17/1/23.
//  Copyright © 2017年 Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSONStirng)

/**
 @brief 字典转化JSON字符串
 @return 转化后的字符串
 @notice 定义了IS_DEBUG 如果调试模式会打印错误信息，否则不会
 */
- (NSString *)convertToJsonStr;

@end
