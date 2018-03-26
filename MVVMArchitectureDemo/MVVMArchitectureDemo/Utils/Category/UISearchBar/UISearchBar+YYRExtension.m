//
//  UISearchBar+YYRExtension.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "UISearchBar+YYRExtension.h"

@implementation UISearchBar (YYRExtension)

+ (void)load {
    // 修改按钮标题文字属性( 颜色, 大小, 字体)
    [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTitleTextAttributes:@{NSForegroundColorAttributeName: YYR_MAIN_TINTCOLOR, NSFontAttributeName: [UIFont systemFontOfSize:16]} forState:UIControlStateNormal];
    // 将searchBar的cancel按钮改成中文的
    [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitle:@"取消"];
}

- (void)yyr_configureSearchBar {
    self.searchBarStyle = UISearchBarStyleProminent;
    self.barStyle = UIBarStyleDefault;
    
    self.barTintColor = YYR_MAIN_BACKGROUNDCOLOR;
    self.tintColor = YYR_MAIN_TINTCOLOR;
    
    /// 去掉SearchBar的上下的黑色细线
    UIImageView *view = [[[self.subviews objectAtIndex:0] subviews] firstObject];
    view.layer.borderColor = YYRColorFromHexString(@"#DFDFDD").CGColor;
    view.layer.borderWidth = 1;
    
    self.backgroundImage = YYRImageNamed(@"widget_searchbar_cell_bg_5x44");
    [self setSearchFieldBackgroundImage:YYRImageNamed(@"widget_searchbar_textfield_17x28") forState:UIControlStateNormal];
    [self setImage:YYRImageNamed(@"SearchContactsBarIcon_20x20") forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    
    self.searchTextPositionAdjustment = UIOffsetMake(5, 0);
    self.placeholder = @"搜索";
}

@end
