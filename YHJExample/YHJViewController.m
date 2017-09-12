//
//  YHJViewController.m
//  YHJExample
//
//  Created by MRJ on 2017/9/10.
//  Copyright © 2017年 MRJ. All rights reserved.
//

#import "YHJViewController.h"
#import "BuildListRequest.h"
#import <MRJ_Network/MRJ_NetworkConfig.h>
#import "Filter.h"
#import "XJRequest.h"

@interface YHJViewController ()

@end

@implementation YHJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(69, 69, 60, 45);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"net" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark method
- (void)clickBtn{
    [self xiaojiGameList];
}

- (void)xiaojiGameList{
    XJRequest *request = [[XJRequest alloc] init];
//    request.requestHeaderFieldValueDictionary = @{};
    request.requestArgument = @{@"action":@"gamelist", @"clientparams":@"1.5.4beta|10.3.3|zh|iPhone8,2|414*736|ios1.1|handleshenzhen", @"model":@"appstore", @"page":@"1", @"pageszie":@"20", @"rank":@"1"};
    [request startWithCompletionBlockWithSuccess:^(__kindof MRJ_BaseRequest * _Nonnull request) {
        
    } failure:^(__kindof MRJ_BaseRequest * _Nonnull request) {
        
    }];
}

- (void)topsList{
    BuildListRequest *request = [[BuildListRequest alloc] init];
    MRJ_NetworkConfig *config = [MRJ_NetworkConfig sharedConfig];
    Filter *filter = [[Filter alloc] init];
    [config addUrlFilter:filter];
    [request startWithCompletionBlockWithSuccess:^(__kindof MRJ_BaseRequest * _Nonnull request) {
        NSLog(@"-=-=-=-=-=-=-=-=-=-%@", request.responseObject);
    } failure:^(__kindof MRJ_BaseRequest * _Nonnull request) {
        NSLog(@"*******************%@", request.error.localizedDescription);
    }];

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
