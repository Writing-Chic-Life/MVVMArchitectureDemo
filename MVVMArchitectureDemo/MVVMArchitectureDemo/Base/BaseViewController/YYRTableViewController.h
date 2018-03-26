//
//  YYRTableViewController.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//
//  所有需要显示tableView的自定义的视图控制器的基类

#import "YYRViewController.h"
#import "YYRTableViewModel.h"
#import "YYRTableView.h"

@interface YYRTableViewController : YYRViewController<UITableViewDelegate , UITableViewDataSource>

/// The table view for tableView controller.
/// tableView
@property (nonatomic, readonly, weak) YYRTableView *tableView;

/// `tableView` 的内容缩进，default is UIEdgeInsetsMake(64,0,0,0)，you can override it
@property (nonatomic, readonly, assign) UIEdgeInsets contentInset;

/// reload tableView data , sub class can override
- (void)reloadData;

/// dequeueReusableCell
- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;

/// configure cell data
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object;

@end
