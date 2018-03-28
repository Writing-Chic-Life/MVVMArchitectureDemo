//
//  YYRMainTabBarController.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/27.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRMainTabBarController.h"
#import "YYRNavigationController.h"
#import "YYRHomePageViewController.h"
#import "YYRContactsViewController.h"
#import "YYRDiscoverViewController.h"
#import "YYRProfileViewController.h"

@interface YYRMainTabBarController ()

/// viewModel
@property (strong, nonatomic, readonly) YYRMainTabBarViewModel *viewModel;

@end

@implementation YYRMainTabBarController

@dynamic viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /// 初始化所有的子控制器
    [self _setUpAllChildViewController];
    
    /// set delegate
    self.tabBarController.delegate = self;
}


#pragma mark - 初始化所有的子视图控制器
- (void)_setUpAllChildViewController {
    NSArray *titlesArray = @[@"微信", @"通讯录", @"发现", @"我"];
    NSArray *imageNamesArray = @[@"tabbar_mainframe_25x23",
                                 @"tabbar_contacts_27x23",
                                 @"tabbar_discover_23x23",
                                 @"tabbar_me_23x23"];
    NSArray *selectedImageNamesArray = @[@"tabbar_mainframeHL_25x23",
                                         @"tabbar_contactsHL_27x23",
                                         @"tabbar_discoverHL_23x23",
                                         @"tabbar_meHL_23x23"];
    /// 微信会话层
    UINavigationController *homeNavigationController = ({
        YYRHomePageViewController *homeViewController = [[YYRHomePageViewController alloc] initWithViewModel:self.viewModel.homepageViewModel];
        YYRTabBarItemTagType tagType = YYRTabBarItemTagTypeHomePage;
        // 配置
        [self _configViewController:homeViewController imageName:imageNamesArray[tagType] selectedImageName:selectedImageNamesArray[tagType] title:titlesArray[tagType] ItemTag:tagType];
        /// 添加到导航栏的栈底控制器
        [[YYRNavigationController alloc] initWithRootViewController:homeViewController];
    });
    
    /// 通讯录
    UINavigationController *contactsNavigationController = ({
        YYRContactsViewController *contactsViewController = [[YYRContactsViewController alloc] initWithViewModel:self.viewModel.homepageViewModel];
        YYRTabBarItemTagType tagType = YYRTabBarItemTagTypeContacts;
        // 配置
        [self _configViewController:contactsViewController imageName:imageNamesArray[tagType] selectedImageName:selectedImageNamesArray[tagType] title:titlesArray[tagType] ItemTag:tagType];
        /// 添加到导航栏的栈底控制器
        [[YYRNavigationController alloc] initWithRootViewController:contactsViewController];
    });
    
    /// 发现
    UINavigationController *discoverNavigationController = ({
        YYRDiscoverViewController *discoverViewController = [[YYRDiscoverViewController alloc] initWithViewModel:self.viewModel.homepageViewModel];
        YYRTabBarItemTagType tagType = YYRTabBarItemTagTypeHomePage;
        // 配置
        [self _configViewController:discoverViewController imageName:imageNamesArray[tagType] selectedImageName:selectedImageNamesArray[tagType] title:titlesArray[tagType] ItemTag:tagType];
        /// 添加到导航栏的栈底控制器
        [[YYRNavigationController alloc] initWithRootViewController:discoverViewController];
    });
    
    /// 我的
    UINavigationController *profileNavigationController = ({
        YYRProfileViewController *profileViewController = [[YYRProfileViewController alloc] initWithViewModel:self.viewModel.homepageViewModel];
        YYRTabBarItemTagType tagType = YYRTabBarItemTagTypeHomePage;
        // 配置
        [self _configViewController:profileViewController imageName:imageNamesArray[tagType] selectedImageName:selectedImageNamesArray[tagType] title:titlesArray[tagType] ItemTag:tagType];
        /// 添加到导航栏的栈底控制器
        [[YYRNavigationController alloc] initWithRootViewController:profileViewController];
    });
    
     /// 添加到tabBarController的子视图
    self.tabBarController.viewControllers = @[homeNavigationController, contactsNavigationController, discoverNavigationController, profileNavigationController];
    
    // 配置栈底
    [YYRSharedAppDelegate.navigationControllerStack pushNavigationController:homeNavigationController];
}

#pragma mark - 配置ViewController
- (void)_configViewController:(UIViewController *)viewController imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName title:(NSString *)title ItemTag:(YYRTabBarItemTagType)tagType {
    
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.image = image;
    viewController.tabBarItem.tag = tagType;
    
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = selectedImage;
    viewController.tabBarItem.title = title;
    
    NSDictionary *normalAttr = @{NSForegroundColorAttributeName:YYRColorFromHexString(@"#929292"),
                                 NSFontAttributeName:YYRRegularFont_10};
    NSDictionary *selectedAttr = @{NSForegroundColorAttributeName:YYRColorFromHexString(@"#09AA07"),
                                   NSFontAttributeName:YYRRegularFont_10};
    [viewController.tabBarItem setTitleTextAttributes:normalAttr forState:UIControlStateNormal];
    [viewController.tabBarItem setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];
    
    [viewController.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, 0)];
    [viewController.tabBarItem setImageInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
}

//#pragma mark - UITabBarControllerDelegate
//- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
//    /// 需要判断是否登录
//    if ([[self.viewModel.services client] isLogin]) return YES;
//
//    YYRTabBarItemTagType tagType = viewController.tabBarItem.tag;
//
//    switch (tagType) {
//        case YYRTabBarItemTagTypeHomePage:
//        case MHTabBarItemTagTypeConsign:
//            return YES;
//            break;
//        case YYRTabBarItemTagTypeMessage:
//        case YYRTabBarItemTagTypeProfile:
//        {
//            @weakify(self);
//            [[self.viewModel.services client] checkLogin:^{
//                @strongify(self);
//                self.tabBarController.selectedViewController = viewController;
//                [self tabBarController:tabBarController didSelectViewController:viewController];
//            } cancel:NULL];
//            return NO;
//        }
//            break;
//    }
//    return NO;
//}
//
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"viewController   %@  %zd",viewController,viewController.tabBarItem.tag);
    [YYRSharedAppDelegate.navigationControllerStack popNavigationController];
    [YYRSharedAppDelegate.navigationControllerStack pushNavigationController:(UINavigationController *)viewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
