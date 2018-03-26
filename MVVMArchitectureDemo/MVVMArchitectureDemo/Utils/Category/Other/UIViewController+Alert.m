//
//  UIViewController+Alert.m
//  SISSAPP
//
//  Created by 优房网 on 2017/7/17.
//  Copyright © 2017年 优房网. All rights reserved.
//

#import "UIViewController+Alert.h"

@implementation UIViewController (Alert)

- (void)alertWithTitle:(NSString *)title message:(NSString *)message {
    
    [self alertWithTitle:title message:message confirmTitle:@"我知道了"];
}

- (void)alertWithTitle:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle {
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:message ? message : @"" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16], NSForegroundColorAttributeName: YYRColorFromHexString(@"0x334A60")}];
    //初始化提示框
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController setValue:attr forKey:@"attributedMessage"];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:confirmAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
