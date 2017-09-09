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
    
    [self setTabBarFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 44)
        contentViewFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64 - 50)];
    
    self.tabBar.itemTitleColor = [UIColor lightGrayColor];
    self.tabBar.itemTitleSelectedColor = [UIColor redColor];
    self.tabBar.itemTitleFont = [UIFont systemFontOfSize:17];
    self.tabBar.itemTitleSelectedFont = [UIFont systemFontOfSize:22];
    self.tabBar.leftAndRightSpacing = 20;
    
    self.tabBar.itemFontChangeFollowContentScroll = YES;
    self.tabBar.itemSelectedBgScrollFollowContent = YES;
    self.tabBar.itemSelectedBgColor = [UIColor redColor];
    
    [self.tabBar setItemSelectedBgInsets:UIEdgeInsetsMake(40, 15, 0, 15) tapSwitchAnimated:NO];
    [self.tabBar setScrollEnabledAndItemFitTextWidthWithSpacing:40];
    
    [self setContentScrollEnabledAndTapSwitchAnimated:NO];
    self.loadViewOfChildContollerWhileAppear = YES;
    
    
    YHJViewController *vc1 = [[YHJViewController alloc] init];
    vc1.MRJ__tabItemTitle = @"a";
    
    YHJViewController *vc2 = [[YHJViewController alloc] init];
    vc2.MRJ__tabItemTitle = @"2";
    
    YHJViewController *vc3 = [[YHJViewController alloc] init];
    vc3.MRJ__tabItemTitle = @"3";
    
    YHJViewController *vc4 = [[YHJViewController alloc] init];
    vc4.MRJ__tabItemTitle = @"4";
    
    YHJViewController *vc5 = [[YHJViewController alloc] init];
    vc5.MRJ__tabItemTitle = @"5";
    
    YHJViewController *vc6 = [[YHJViewController alloc] init];
    vc6.MRJ__tabItemTitle = @"6";
    
    self.viewControllers = @[vc1, vc2, vc3, vc4, vc5, vc6];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
