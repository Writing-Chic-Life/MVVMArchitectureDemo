//
//  UIViewController+Alert.h
//  SISSAPP
//
//  Created by 优房网 on 2017/7/17.
//  Copyright © 2017年 优房网. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Alert)

- (void)alertWithTitle:(NSString *)title message:(NSString *)message;

- (void)alertWithTitle:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle;

@end
