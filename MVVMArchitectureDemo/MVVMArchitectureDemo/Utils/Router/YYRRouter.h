//
//  YYRRouter.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/23.
//  Copyright © 2018年 袁应荣. All rights reserved.
//  ViewModel -- ViewController

#import <Foundation/Foundation.h>
#import "YYRViewController.h"

@interface YYRRouter : NSObject

/// Retrieves the shared router instance.
///
/// Returns the shared router instance.
+ (instancetype)sharedInstance;

/// Retrieves the view corresponding to the given view model.
///
/// viewModel - The view model
///
/// Returns the view corresponding to the given view model.
- (YYRViewController *)viewControllerForViewModel:(YYRViewModel *)viewModel;

@end
