//
//  YYRCommonTableViewController.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRCommonTableViewController.h"
#import "YYRCommonHeaderView.h"
#import "YYRCommonFooterView.h"
#import "YYRCommonTableViewCell.h"

@interface YYRCommonTableViewController ()

/// viewModel
@property (nonatomic, readwrite, strong) YYRCommonTableViewModel *viewModel;

@end

@implementation YYRCommonTableViewController


@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Override
- (void)bindViewModel {
    [super bindViewModel];
}

- (UIEdgeInsets)contentInset {
    return UIEdgeInsetsMake(YYR_APPLICATION_TOP_BAR_HEIGHT+16, 0, 0, 0);
}

- (void)configureCell:(YYRCommonTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object {
    [cell bindViewModel:object];
}

- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    return [YYRCommonTableViewCell cellWithTableView:tableView];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.viewModel.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    YYRCommonGroupViewModel *groupViewModel = self.viewModel.dataSource[section];
    return groupViewModel.itemViewModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    /// fetch cell
    YYRCommonTableViewCell *cell = (YYRCommonTableViewCell *)[self tableView:tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    YYRCommonGroupViewModel *groupViewModel = self.viewModel.dataSource[indexPath.section];
    id object = groupViewModel.itemViewModels[indexPath.row];
    /// bind model
    [self configureCell:cell atIndexPath:indexPath withObject:(id)object];
    [cell setIndexPath:indexPath rowsInSection:groupViewModel.itemViewModels.count];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    YYRCommonFooterView *footerView = [YYRCommonFooterView footerViewWithTableView:tableView];
    YYRCommonGroupViewModel *groupViewModel = self.viewModel.dataSource[section];
    [footerView bindViewModel:groupViewModel];
    return footerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    YYRCommonHeaderView *headerView = [YYRCommonHeaderView headerViewWithTableView:tableView];
    YYRCommonGroupViewModel *groupViewModel = self.viewModel.dataSource[section];
    [headerView bindViewModel:groupViewModel];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    YYRCommonGroupViewModel *groupViewModel = self.viewModel.dataSource[indexPath.section];
    YYRCommonItemViewModel *itemViewModel = groupViewModel.itemViewModels[indexPath.row];
    return itemViewModel.rowHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    YYRCommonGroupViewModel *groupViewModel = self.viewModel.dataSource[section];
    return groupViewModel.headerHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    YYRCommonGroupViewModel *groupViewModel = self.viewModel.dataSource[section];
    return groupViewModel.footerHeight;
}

@end
