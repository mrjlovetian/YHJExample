//
//  MRJViewController.m
//  YHJExample
//
//  Created by Mr on 2017/9/25.
//  Copyright © 2017年 MRJ. All rights reserved.
//

#import "MRJViewController.h"
#import "MRJLoalRequest.h"
#import "MRJFliter.h"

@interface MRJViewController ()

@end

@implementation MRJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(69, 69, 69, 69);
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:btn];
    
    // Do any additional setup after loading the view.
}

- (void)click{
    MRJLoalRequest *request = [[MRJLoalRequest alloc] init];
    [request startWithCompletionBlockWithSuccess:^(__kindof MRJ_BaseRequest * _Nonnull request) {
        MRJ_Log(@"**************%@", request.responseObject);
    } failure:^(__kindof MRJ_BaseRequest * _Nonnull request) {
        MRJ_Log(@"%@------%@", request.error, request.responseObject);
    }];
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
