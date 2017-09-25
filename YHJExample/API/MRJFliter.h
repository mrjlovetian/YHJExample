//
//  MRJFliter.h
//  YHJExample
//
//  Created by Mr on 2017/9/25.
//  Copyright © 2017年 MRJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MRJ_Network/MRJ_NetworkConfig.h>

@interface MRJFliter : NSObject<MRJ_UrlFilterProtocol>
- (NSString *)filterUrl:(NSString *)originUrl withRequest:(MRJ_BaseRequest *)request;
@end
