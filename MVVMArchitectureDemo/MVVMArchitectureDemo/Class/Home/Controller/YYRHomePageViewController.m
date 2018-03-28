//
//  YYRHomePageViewController.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/27.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRHomePageViewController.h"
#import "YYRHomePageTableViewCell.h"

@interface YYRHomePageViewController ()

/// viewModel
@property (nonatomic, readwrite, strong) YYRHomePageViewModel *viewModel;

@end

@implementation YYRHomePageViewController

@dynamic viewModel;

- (void)viewDidLoad {
    // ①：子类调用父类的viewDidLoad方法，而父类主要是创建tableView以及强行布局子控件，从而导致tableView刷新，这样就会去走tableView的数据源方法
    [super viewDidLoad];
    
    // 设置
    [self _setup];
    
    // 设置导航栏
    [self _setupNavigationItem];
    
    // ③：注册cell
    [self.tableView yyr_registerCell:YYRHomePageTableViewCell.class];
}

#pragma mark - Override
/// 配置tableView的区域
- (UIEdgeInsets)contentInset {
    return UIEdgeInsetsMake(YYR_APPLICATION_TOP_BAR_HEIGHT, 0, YYR_APPLICATION_TAB_BAR_HEIGHT, 0);
}

/// 返回自定义的cell
- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
     // ②：父类的tableView的数据源方法的获取cell是通过注册cell的identifier来获取cell，然而此时子类并未注册cell，所以取出来的cell = nil而引发Crash
    return [tableView dequeueReusableCellWithIdentifier:@"YYRHomePageTableViewCell"];
    // 非注册cell 使用时：去掉ViewDidLoad里面注册Cell的代码
    //    return [YYRHomePageTableViewCell cellWithTableView:tableView];
}

/// 绑定数据
- (void)configureCell:(YYRHomePageTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object {
    [cell bindViewModel:object];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.viewModel.dataSource[indexPath.row] cellHeight];
}

#pragma mark - 事件处理
- (void)_addMore{
    YYRLogFunc;
}

#pragma mark - 初始化
- (void)_setup {
    /// set up ...
}

#pragma mark - 设置导航栏
- (void)_setupNavigationItem {
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem yyr_systemItemWithTitle:nil titleColor:nil imageName:@"" target:self selector:@selector(_addMore) textType:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
