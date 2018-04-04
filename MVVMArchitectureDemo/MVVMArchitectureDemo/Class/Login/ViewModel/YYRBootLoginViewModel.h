//
//  YYRBootLoginViewModel.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/30.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRViewModel.h"

@interface YYRBootLoginViewModel : YYRViewModel

/// loginCommand
@property (nonatomic, readonly, strong) RACCommand *loginCommand;
/// registerCommand
@property (nonatomic, readonly, strong) RACCommand *registerCommand;
/// languageCommand
@property (nonatomic, readonly, strong) RACCommand *languageCommand;

/// language
@property (nonatomic, readonly, copy) NSString *language;

@end
