//
//  YYRHTTPService+Live.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/28.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRHTTPService+Live.h"

@implementation YYRHTTPService (Live)

/// 获取直播间列表
- (RACSignal *)fetchLivesWithUseridx:(NSString *)useridx type:(NSInteger)type page:(NSInteger)page lat:(NSNumber *)lat lon:(NSNumber *)lon province:(NSString *)province {
    // 1.配置参数
    YYRKeyedSubscript *subscript = [YYRKeyedSubscript subscript];
    subscript[@"useridx"] = useridx;
    subscript[@"type"] = @(type);
    subscript[@"page"] = @(page);
    if (lat == nil) subscript[@"lat"] = @(22.54192103514200);
    if (lon == nil) subscript[@"lon"] = @(113.96939828211362);
    if (province == nil) subscript[@"province"] = @"广东省";
    
    // 2.配置参数模型 #define YYR_GET_LIVE_ROOM_LIST  @"Room/GetHotLive_v2"
    YYRURLParameters *paramters = [YYRURLParameters urlParametersWithMethod:YYR_HTTTP_METHOD_GET path:YYR_GET_LIVE_ROOM_LIST parameters:subscript.dictionary];
    // 3.发起请求
    return [[[YYRHTTPRequest requestWithParameters:paramters] enqueueResultClass:[YYRLiveRoom class]] yyr_parsedResults];
    
    /** 复杂的方式
     /// 配置请求模型
     YYRHTTPRequest *request = [YYRHTTPRequest requestWithParameters:paramters];
     /// 发起请求
     return [[YYRHTTPService sharedInstance] enqueueRequest:request resultClass:[YYRLiveRoom class]];
     */
}

@end
