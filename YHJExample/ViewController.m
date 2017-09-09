//
//  ViewController.m
//  YHJExample
//
//  Created by MRJ on 2017/9/10.
//  Copyright © 2017年 MRJ. All rights reserved.
//

#import "ViewController.h"
#import "YHJViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YHJViewController *vc1 = [[YHJViewController alloc] init];
    vc1.title = @"a";
    
    YHJViewController *vc2 = [[YHJViewController alloc] init];
    vc2.title = @"2";
    
    YHJViewController *vc3 = [[YHJViewController alloc] init];
    vc3.title = @"3";
    
    YHJViewController *vc4 = [[YHJViewController alloc] init];
    vc4.title = @"4";
    
    YHJViewController *vc5 = [[YHJViewController alloc] init];
    vc5.title = @"5";
    
    YHJViewController *vc6 = [[YHJViewController alloc] init];
    vc6.title = @"6";
    
    self.viewControllers = @[vc1, vc2, vc3, vc4, vc5, vc6];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
