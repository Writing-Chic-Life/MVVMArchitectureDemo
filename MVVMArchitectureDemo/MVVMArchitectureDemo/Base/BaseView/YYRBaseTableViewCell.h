//
//  YYRBaseTableViewCell.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/28.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYRBaseTableViewCell : UITableViewCell

/**
 *  统一在此方法进行cell的初始化
 */
- (void)initUI;

/**
 统一在此方法设置约束
 */
- (void)initConstraint;

@end
