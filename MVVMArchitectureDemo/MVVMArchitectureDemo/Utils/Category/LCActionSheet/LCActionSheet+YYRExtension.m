//
//  LCActionSheet+YYRExtension.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "LCActionSheet+YYRExtension.h"

@implementation LCActionSheet (YYRExtension)

+ (void)yyr_configureActionSheet {
    LCActionSheetConfig *config = LCActionSheetConfig.config;
    
    /// 蒙版可点击
    config.darkViewNoTaped = NO;
    config.separatorColor = YYR_MAIN_LINE_COLOR_1;
    config.buttonColor = [UIColor colorFromHexString:@"#3C3E44"];
    config.buttonFont = YYRRegularFont_16;
    config.unBlur = YES;
    config.darkOpacity = .6f;
    
    /// 设置
    config.titleEdgeInsets = UIEdgeInsetsMake(27, 22, 27, 22);
    config.titleFont = YYRRegularFont_13;
    
}

@end
