//
//  YYRMobileLoginView.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/4/3.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRBaseView.h"
#import "YYRReactiveView.h"

@interface YYRMobileLoginView : YYRBaseView <YYRReactiveView>

+ (instancetype)mobileLoginView;

/// zoneCodeTextField
@property (weak, nonatomic) UITextField *zoneCodeTextField;

/// phoneTextField
@property (weak, nonatomic) UITextField *phoneTextField;

/// zoneName
@property (copy, nonatomic) NSString *zoneName;

/// title
@property (weak, nonatomic) UILabel *titleLabel;

@end
