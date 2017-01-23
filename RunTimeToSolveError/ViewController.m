//
//  ViewController.m
//  RunTimeToSolveError
//
//  Created by apple on 17/1/23.
//  Copyright © 2017年 Wang. All rights reserved.
//

#import "ViewController.h"
#import "CyanVC.h"
#import "OrangeVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CyanVC *VC1 = [[CyanVC alloc]init];
    OrangeVC *VC2 = [[OrangeVC alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
    [self.navigationController pushViewController:VC2 animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
