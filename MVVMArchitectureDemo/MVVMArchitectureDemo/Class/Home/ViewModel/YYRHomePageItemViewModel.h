//
//  YYRHomePageItemViewModel.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/28.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYRLiveRoom.h"

@interface YYRHomePageItemViewModel : NSObject

/// LiveRoom
@property (nonatomic, readonly, strong) YYRLiveRoom *liveRoom;

/// girlStar
@property (nonatomic, readonly, copy) NSString *girlStar;

/// 观众人数
@property (nonatomic, readonly, copy) NSAttributedString *allNumAttr;

/// cellHeight
@property (nonatomic, readonly, assign) CGFloat cellHeight;

/// init
- (instancetype)initWithLiveRoom:(YYRLiveRoom *)liveRoom;

@end
