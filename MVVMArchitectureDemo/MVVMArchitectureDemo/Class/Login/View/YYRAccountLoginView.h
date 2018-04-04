//
//  YYRAccountLoginView.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/4/3.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRBaseView.h"

@interface YYRAccountLoginView : YYRBaseView

/// 账号
@property (weak, nonatomic) UITextField *accountTextField;

/// 密码
@property (weak, nonatomic) UITextField *passwordTextField;


+ (instancetype)accoutLoginView;

@end
