//
//  YYRNavigationControllerStack.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/23.
//  Copyright © 2018年 袁应荣. All rights reserved.
//  `view` 层维护一个 `MYYRNavigationController` 的堆栈 YYRNavigationControllerStack ，不管是 push/pop 还是 present/dismiss ，都使用栈顶的 YYRNavigationController 来执行导航操作，且并且保证 present 出来的是一个 YYRNavigationController 

#import <Foundation/Foundation.h>

@protocol YYRViewModelServices;

@interface YYRNavigationControllerStack : NSObject

/// Initialization method. This is the preferred way to create a new navigation controller stack.
///
/// services - The service bus of the `Model` layer.
///
/// Returns a new navigation controller stack.
- (instancetype)initWithServices:(id<YYRViewModelServices>)services;

/// Pushes the navigation controller.
///
/// navigationController - the navigation controller
- (void)pushNavigationController:(UINavigationController *)navigationController;

/// Pops the top navigation controller in the stack.
///
/// Returns the popped navigation controller.
- (UINavigationController *)popNavigationController;

/// Retrieves the top navigation controller in the stack.
///
/// Returns the top navigation controller in the stack.
- (UINavigationController *)topNavigationController;

@end
