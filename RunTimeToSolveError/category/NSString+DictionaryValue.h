//
//  NSString+DictionaryValue.h
//  RunTimeToSolveError
//
//  Created by apple on 17/1/23.
//  Copyright © 2017年 Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DictionaryValue)

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

@end
