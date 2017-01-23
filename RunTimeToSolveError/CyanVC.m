//
//  CyanVC.m
//  RunTimeToSolveError
//
//  Created by apple on 17/1/23.
//  Copyright © 2017年 Wang. All rights reserved.
//

#import "CyanVC.h"
#import "NSDictionary+JSONStirng.h"
#import "NSString+DictionaryValue.h"

@interface CyanVC ()

@end

@implementation CyanVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    NSString *password = nil;
    NSDictionary *dict = @{
                           @"userName": @"bruce",
                           @"password": password
                           };
    id objects[] = { @"nimei", @"Hello, World!", @42, password};
    id keys[] = { @"anObject", @"helloString", @"magicNumber", @"aValue" };
    NSUInteger count = sizeof(objects) / sizeof(id);
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithObjects:objects
                                                           forKeys:keys
                                                             count:count];
    [dictionary setObject:password forKey:@"anyObject"];
    NSLog(@"dict is : %@ \n %@", dict,dictionary);
    
    NSArray *arr = @[@"kaishi"];
    [arr objectAtIndex:1];
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    [array addObject:@"w"];
    [array addObject:@"e"];
    [array addObject:@"r"];

    [array objectAtIndex:3];
    [array insertObject:@"7" atIndex:2];
    NSLog(@"arr is : %@\n %@", arr,array);

    NSString *str = [dictionary convertToJsonStr];
    NSLog(@"str is :%@",str);
    
    NSLog(@"dic is :%@",[NSString dictionaryWithJsonString:str]);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
