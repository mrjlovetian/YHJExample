//
//  XJRequest.m
//  YHJExample
//
//  Created by Mr on 2017/9/12.
//  Copyright © 2017年 MRJ. All rights reserved.
//

#import "XJRequest.h"

@implementation XJRequest
- (NSString *)requestUrl{
    return @"http://client.vgabc.com/clientapi/";
}

- (MRJ_RequestMethod)requestMethod{
    return MRJ_RequestMethodPOST;
}
@end
