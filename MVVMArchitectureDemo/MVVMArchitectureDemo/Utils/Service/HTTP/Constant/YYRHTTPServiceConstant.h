//
//  YYRHTTPServiceConstant.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/23.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#ifndef YYRHTTPServiceConstant_h
#define YYRHTTPServiceConstant_h

/// 服务器相关
#define YYRHTTPRequestTokenKey @"token"

/// 私钥key
#define YYRHTTPServiceKey  @"privatekey"
/// 私钥Value
#define YYRHTTPServiceKeyValue @"/** 你的私钥 **/"

/// 签名key
#define YYRHTTPServiceSignKey @"sign"

/// 服务器返回的三个固定字段
/// 状态码key
#define YYRHTTPServiceResponseCodeKey @"code"
/// 消息key
#define YYRHTTPServiceResponseMsgKey    @"msg"
/// 数据data
#define YYRHTTPServiceResponseDataKey   @"data"
/// 数据data{"list":[]}
#define YYRHTTPServiceResponseDataListKey   @"list"

#endif /* YYRHTTPServiceConstant_h */
