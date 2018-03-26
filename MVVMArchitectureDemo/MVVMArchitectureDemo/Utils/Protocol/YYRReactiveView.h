//
//  YYRReactiveView.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/23.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <Foundation/Foundation.h>
/// A protocol which is adopted by views which are backed by view models.
@protocol YYRReactiveView <NSObject>
/// Binds the given view model to the view.
///
/// viewModel - The view model
- (void)bindViewModel:(id)viewModel;
@end
