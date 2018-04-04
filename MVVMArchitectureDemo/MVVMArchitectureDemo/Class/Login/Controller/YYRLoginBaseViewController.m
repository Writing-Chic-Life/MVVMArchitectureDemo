//
//  YYRLoginBaseViewController.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/30.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRLoginBaseViewController.h"

@interface YYRLoginBaseViewController ()

@end

@implementation YYRLoginBaseViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    /// 设置颜色
    [self.navigationController.navigationBar setBarTintColor:YYR_MAIN_NAVIGATIONBAR_BACKGROUNDCOLOR_3];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    /// 设置颜色
    [self.navigationController.navigationBar setBarTintColor:YYR_MAIN_NAVIGATIONBAR_BACKGROUNDCOLOR_1];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = YYRColorFromHexString(@"#F3F3F3");
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
