//
//  UITableViewCell+Alert.m
//  SISSAPP
//
//  Created by 袁应荣 on 2017/11/14.
//  Copyright © 2017年 优房网. All rights reserved.
//

#import "UITableViewCell+Alert.h"

@implementation UITableViewCell (Alert)

- (void)alertWithTitle:(NSString *)title message:(NSString *)message {
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:message attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:16], NSForegroundColorAttributeName:YYRColorFromHexString(@"0x334A60")}];
    //初始化提示框
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController setValue:attr forKey:@"attributedMessage"];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:confirmAction];
    UIResponder *responder = self;
    UIViewController *viewController;
    while ((responder = [responder nextResponder]))
        if ([responder isKindOfClass: [UIViewController class]])
            viewController = (UIViewController *)responder;
    [viewController presentViewController:alertController animated:YES completion:nil];
}

@end
