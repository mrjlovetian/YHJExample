//
//  Filter.h
//  YHJExample
//
//  Created by Mr on 2017/9/12.
//  Copyright © 2017年 MRJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MRJ_Network/MRJ_NetworkConfig.h>
#import <MRJ_Network/MRJ_BaseRequest.h>

@interface Filter : NSObject<MRJ_UrlFilterProtocol>
//+ (Filter *)filterArguments:(NSDictionary *)arguments;
- (NSString *)filterUrl:(NSString *)originUrl withRequest:(MRJ_BaseRequest *)request;
@end
