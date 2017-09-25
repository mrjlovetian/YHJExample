//
//  ViewController.m
//  YHJExample
//
//  Created by MRJ on 2017/9/10.
//  Copyright © 2017年 MRJ. All rights reserved.
//

#import "ViewController.h"
#import "YHJViewController.h"
#import <MRJActionSheet/MRJActionSheet.h>
#import "MRJViewController.h"

@interface ViewController ()<MRJActionSheetDelegate>

@end

@implementation ViewController

#pragma mark MRJActionSheetDelegate

- (void)actionSheet:(MRJActionSheet *)actionSheet didClickedButtonAtIndex:(int)buttonIndex{
    NSLog(@"点击了那个按钮-------%d", buttonIndex);
}

#pragma mark method

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViews];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)initViews{
    [self setTabBarFrame:CGRectMake(0, 80, [UIScreen mainScreen].bounds.size.width, 44)
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
    vc1.mrj_tabItemTitle = @"a";
    
    YHJViewController *vc2 = [[YHJViewController alloc] init];
    vc2.mrj_tabItemTitle = @"2";
    
    YHJViewController *vc3 = [[YHJViewController alloc] init];
    vc3.mrj_tabItemTitle = @"3";
    
    YHJViewController *vc4 = [[YHJViewController alloc] init];
    vc4.mrj_tabItemTitle = @"4";
    
    YHJViewController *vc5 = [[YHJViewController alloc] init];
    vc5.mrj_tabItemTitle = @"5";
    
    MRJViewController *vc6 = [[MRJViewController alloc] init];
    vc6.mrj_tabItemTitle = @"6";
    
    self.viewControllers = @[vc1, vc2, vc3, vc4, vc5, vc6];
    
    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(69, 69, 60, 45);
//    btn.backgroundColor = [UIColor redColor];
//    [btn setTitle:@"点击" forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
}

- (void)clickBtn{
    
    MRJActionSheet *shett = [[MRJActionSheet alloc] initWithTitle:@"标题啊" buttonTitles:@[@"第一个按钮", @"第二个按钮", @"第三个按钮", @"第四个按钮"] redButtonIndex:-1 defColor:nil delegate:self];
    [shett show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
