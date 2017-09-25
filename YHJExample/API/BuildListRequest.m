//
//  BuildListRequest.m
//  YHJExample
//
//  Created by Mr on 2017/9/12.
//  Copyright © 2017年 MRJ. All rights reserved.
//

#import "BuildListRequest.h"

@implementation BuildListRequest
-(NSString *)requestUrl{
    return @"/v1/building/buildingList?cityId=112&isPre=3&latitude=37.33425284887667&longitude=-122.0133690826253&pageIndex=1&pageSize=14&propertyId=0&regionId=0&sellPointId=0&sortId=";
}

- (MRJ_RequestMethod)requestMethod{
    return MRJ_RequestMethodGET;
}
@end
