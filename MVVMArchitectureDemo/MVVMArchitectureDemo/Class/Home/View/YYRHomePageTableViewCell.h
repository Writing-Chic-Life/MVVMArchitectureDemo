//
//  YYRHomePageTableViewCell.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/28.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRBaseTableViewCell.h"
#import "YYRReactiveView.h"

@interface YYRHomePageTableViewCell : YYRBaseTableViewCell<YYRReactiveView>

/// 返回cell
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
