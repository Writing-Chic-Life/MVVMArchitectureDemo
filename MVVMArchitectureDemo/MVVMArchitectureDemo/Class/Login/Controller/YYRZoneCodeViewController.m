//
//  YYRZoneCodeViewController.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/4/3.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRZoneCodeViewController.h"
#import "YYRCommonTableViewCell.h"

@interface YYRZoneCodeViewController ()

/// viewModel
@property (nonatomic, readonly, strong) YYRZoneCodeViewModel *viewModel;
/// searchController
@property (nonatomic, readwrite, strong) UISearchController *searchController;

@end

@implementation YYRZoneCodeViewController

@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self _setupNavigationItem];
    [self _setupSubViews];
    
    [self.tableView registerClass:[YYRCommonTableViewCell class] forCellReuseIdentifier:@"YYRCommonTableViewCell"];
}

- (void)_back {
    [self.viewModel.closeCommand execute:nil];
}

#pragma mark - 设置导航栏
- (void)_setupNavigationItem {
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem yyr_backItemWithTitle:@"返回" imageName:@"barbuttonicon_back_15x30" target:self action:@selector(_back)];
}

/// 返回自定义的cell
- (UITableViewCell *)tableView:(UITableView *)tableView dequeueReusableCellWithIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    // ②：父类的tableView的数据源方法的获取cell是通过注册cell的identifier来获取cell，然而此时子类并未注册cell，所以取出来的cell = nil而引发Crash
    
//    return [tableView dequeueReusableCellWithIdentifier:@"YYRCommonTableViewCell"];
    // 非注册cell 使用时：去掉ViewDidLoad里面注册Cell的代码
        return [YYRCommonTableViewCell cellWithTableView:tableView style:UITableViewCellStyleSubtitle];
}

- (void)configureCell:(YYRCommonTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath withObject:(id)object {
    
    [cell bindViewModel:object];
}

// 返回组头
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.viewModel.headersArr[section];
}

#pragma mark - 设置子控件
- (void)_setupSubViews {
    
    UIView *tableHeaderView = [[UIView alloc] init];
    tableHeaderView.backgroundColor = self.view.backgroundColor;
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.hidesNavigationBarDuringPresentation = YES;
    
    // 配置SearchBar
    UISearchBar *searchBar = self.searchController.searchBar;
    [searchBar yyr_configureSearchBar];
    [searchBar sizeToFit];
    self.tableView.tableHeaderView = searchBar;
    self.definesPresentationContext = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
