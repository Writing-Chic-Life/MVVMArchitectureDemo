//
//  YYRCommonFooterView.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYRReactiveView.h"

@interface YYRCommonFooterView : UITableViewHeaderFooterView<YYRReactiveView>

/// init
+ (instancetype)footerViewWithTableView:(UITableView *)tableView;

@end
