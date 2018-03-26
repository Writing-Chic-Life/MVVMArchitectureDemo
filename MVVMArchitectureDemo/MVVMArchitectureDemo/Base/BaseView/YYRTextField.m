//
//  YYRTextField.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/23.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRTextField.h"

@implementation YYRTextField

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.tintColor = YYR_MAIN_TINTCOLOR;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.tintColor = YYR_MAIN_TINTCOLOR;
    }
    return self;
}

@end
