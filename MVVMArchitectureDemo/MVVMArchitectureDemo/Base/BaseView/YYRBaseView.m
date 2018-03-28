//
//  YYRBaseView.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/28.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRBaseView.h"

@implementation YYRBaseView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI];
        [self initConstraint];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initUI];
        [self initConstraint];
    }
    return self;
}

- (void)initUI {
    
    self.backgroundColor = [UIColor whiteColor];
}

- (void)initConstraint {
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //将键盘缩回去,让控制器所管理的UIView结束编辑
    [self endEditing:YES];
    [self.superview endEditing:YES];
}

@end
