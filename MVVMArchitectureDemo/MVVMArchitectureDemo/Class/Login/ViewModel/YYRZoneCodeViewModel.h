//
//  YYRZoneCodeViewModel.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/4/3.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRTableViewModel.h"

@interface YYRZoneCodeViewModel : YYRTableViewModel

/// closeCommand
@property (nonatomic, readonly, strong) RACCommand *closeCommand;

@property (nonatomic, readwrite, copy) NSArray *headersArr;

@end
