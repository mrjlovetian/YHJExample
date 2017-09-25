//
//  MRJLoalRequest.m
//  YHJExample
//
//  Created by Mr on 2017/9/25.
//  Copyright © 2017年 MRJ. All rights reserved.
//

#import "MRJLoalRequest.h"

@implementation MRJLoalRequest
- (MRJ_RequestMethod)requestMethod{
    return MRJ_RequestMethodGET;
}

- (NSString *)requestUrl{
    return @"http://www.mrj.com";
}
@end
