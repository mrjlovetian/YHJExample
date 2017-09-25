//
//  Filter.m
//  YHJExample
//
//  Created by Mr on 2017/9/12.
//  Copyright © 2017年 MRJ. All rights reserved.
//

#import "Filter.h"
#import <CommonCrypto/CommonDigest.h>
#import <time.h>
#import <xlocale.h>

@implementation Filter{
    NSDictionary *_arguments;
}

- (NSString *)filterUrl:(NSString *)originUrl withRequest:(MRJ_BaseRequest *)request {
    return [self urlStringWithOriginUrlString:originUrl appendParameters:_arguments withRequest:request];
}

- (NSString *)urlStringWithOriginUrlString:(NSString *)originUrlString appendParameters:(NSDictionary *)parameters  withRequest:(MRJ_BaseRequest *)request{
    
    ///根据协议增加参数内容
    //    NSMutableDictionary * requestArguments = [NSMutableDictionary dictionaryWithDictionary: (NSDictionary *)request.requestArgument];
    //    if (parameters && parameters.count > 0) {
    //        [requestArguments addEntriesFromDictionary:parameters];
    //    }
    
    NSMutableDictionary * requestArguments = nil;
    if ([request.requestArgument isKindOfClass:[NSDictionary class]]) {
        requestArguments = [NSMutableDictionary dictionaryWithDictionary: (NSDictionary *)request.requestArgument];
    }
    if (parameters && parameters.count > 0) {
        [requestArguments addEntriesFromDictionary:parameters];
        request.requestArgument = requestArguments;
    }
    
    
    if ([request.requestArgument isKindOfClass:[NSArray class]]) {
        
    }
    
    
    
    
    
    NSString *dateStr = [self rfc1123String];
    NSString *signStr = nil;
    
    //    request.requestUrl = originUrlString;
    
    signStr = [Filter signV4:request.requestSerializerType url:request.requestUrl params:request.requestArgument date:dateStr method:request.requestMethod];
    
    NSDictionary *header = @{
                             @"Date":dateStr,
//                             @"Authorization":app.authorization,
                             @"Signature":signStr,
//                             @"Geolocation":MF_SWF(@"%.6f,%.6f",locationDM.myCoordinate.longitude,locationDM.myCoordinate.latitude),
                             @"Cache-Control":@"max-age=0",
                             @"User-Agent":@"MM/5.3.9 (iOS 10.3.1; iPhone) Scale/3.00 (Simulator; BBAFC458-C102-45AC-9245-DE6BE3E6D5DB) TopsV5",
                             @"Accept-Language":@"en_US",
                             @"appcode":@"app_broker"
                             };
    
    request.requestHeaderFieldValueDictionary = header;
    
    return originUrlString;
    
}

- (NSDate *)destinationDateNow
{
    //设置源日期时区
    NSDate *anyDate = [NSDate date];
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];//或GMT
    //设置转换后的目标日期时区,东八区
    NSTimeZone* destinationTimeZone = [NSTimeZone timeZoneForSecondsFromGMT:8 * 3600];//[NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:anyDate];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:anyDate];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //转为现在时间
    NSDate* destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:anyDate];
    return destinationDateNow;
}

-(NSString*)rfc1123String
{
    time_t date = (time_t)[[self destinationDateNow] timeIntervalSince1970];
    struct tm timeinfo;
    gmtime_r(&date, &timeinfo);
    char buffer[32];
    size_t ret = strftime_l(buffer, sizeof(buffer), "%a, %d %b %Y %H:%M:%S GMT", &timeinfo, NULL);
    if (ret) {
        return @(buffer);
    } else {
        return nil;
    }
}

+ (NSString *)signV4:(MRJ_RequestSerializerType)serializerType url:(NSString*) url params:(NSDictionary *)params date:(NSString *) dateStr method:(NSInteger)method
{
    NSString *urlstr = [NSString stringWithFormat:@"%@",url];
    if(method == MRJ_RequestMethodGET){
        if (params && params.count > 0) {
            NSString *query = AFQueryStringFromParameters(params);
            NSRange range = [url rangeOfString:@"?"];//判断字符串是否包含
            urlstr = [url stringByAppendingFormat:range.location !=NSNotFound?@"&%@" : @"?%@", query];
        }
        params = nil;
    }else if (method == -1){
        params = nil;
    }
    urlstr = [urlstr stringByReplacingOccurrencesOfString:@"https://" withString:@""];
    urlstr = [urlstr stringByReplacingOccurrencesOfString:@"http://" withString:@""];
    urlstr = [urlstr stringByReplacingOccurrencesOfString:@"http:/" withString:@""];
    //    NSRange range = [urlstr rangeOfString:@"?"];//判断字符串是否包含
    //    if (range.location !=NSNotFound)//包含
    //    {
    //        urlstr = [urlstr substringToIndex:range.location];
    //    }
    NSString *body;
    if (params) {
        if([params isKindOfClass:[NSDictionary class]]){
            if(serializerType == MRJ_RequestSerializerTypeJSON){
                body = [self stringOfJson:params];
            }else{
                body = AFQueryStringFromParameters(params);
            }
        }
        else if([params isKindOfClass:[NSArray class]]){
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:0 error:nil];
            if (jsonData) {
                body = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            }
        }
        body = [self toMD5:body];
    }else{
        body = @"00000000000000000000000000000000";
    }
    
    NSString *sce = [NSString stringWithFormat:@"%@%@%@%@",[urlstr lowercaseString],body, dateStr,@"374fa3ab6b1fae595db5382afe415bce"];
    NSString *md5Str = [self toMD5:sce];
    NSString *sginStr = [NSString stringWithFormat:@"v4:%@",md5Str];
    return sginStr;
}

+ (NSString *)stringOfJson:(NSDictionary *)dic
{
    if ([NSJSONSerialization isValidJSONObject:dic]) {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:nil];
        if (jsonData) {
            return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
    }
    return nil;
}

+ (NSString *)toMD5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (int)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
@end
