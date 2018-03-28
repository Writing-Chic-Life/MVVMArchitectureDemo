//
//  YYRHTTPService+Live.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/28.
//  Copyright © 2018年 袁应荣. All rights reserved.
//
//  获取直播相关的接口

#import "YYRHTTPService.h"
#import "YYRLiveRoom.h"

@interface YYRHTTPService (Live)

/**
 获取直播间列表
 @param useridx The current special ` user ` 's idstr
 @param type ；类型：type = 0 为热门
 @param page 获取第几页的数据
 @param lat 维度 ， 可以传 nil ， 则会获取定位的维度
 @param lon 经度 ， 可以传 nil ， 则会获取定位的经度
 @param province 省份 可以传 nil 则会获取定位的省份
 @return Returns a signal which will send complete, or error.
 */
- (RACSignal *)fetchLivesWithUseridx:(NSString *)useridx type:(NSInteger)type page:(NSInteger)page lat:(NSNumber *)lat lon:(NSNumber *)lon province:(NSString *)province;

@end
