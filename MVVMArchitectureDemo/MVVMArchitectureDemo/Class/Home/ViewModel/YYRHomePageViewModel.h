//
//  YYRHomePageViewModel.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/27.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRTableViewModel.h"
#import "YYRHomePageItemViewModel.h"

@interface YYRHomePageViewModel : YYRTableViewModel

/// 商品数组 <MHLiveRoom *>
@property (nonatomic, readonly, copy) NSArray *liveRooms;

@end
