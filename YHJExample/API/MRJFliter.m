//
//  MRJFliter.m
//  YHJExample
//
//  Created by Mr on 2017/9/25.
//  Copyright © 2017年 MRJ. All rights reserved.
//

#import "MRJFliter.h"
#import <MRJ_Network/MRJ_BaseRequest.h>

@implementation MRJFliter

- (NSString *)filterUrl:(NSString *)originUrl withRequest:(MRJ_BaseRequest *)request{
    NSDictionary *header = @{
                             @"Cache-Control":@"max-age=0",
                             @"User-Agent":@"MM/5.3.9 (iOS 10.3.1; iPhone) Scale/3.00 (Simulator; BBAFC458-C102-45AC-9245-DE6BE3E6D5DB) TopsV5",
                             @"Accept-Language":@"en_US",
                             @"appcode":@"app_broker"
                             };
    
    request.requestHeaderFieldValueDictionary = header;
    return originUrl;
}
@end
