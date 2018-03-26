//
//  YYRSegmentedControlController.h
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRViewController.h"

@class YYRSegmentedControlController;

@protocol YYRSegmentedControlControllerDelegate <NSObject>

@optional

- (void)segmentedControlController:(YYRSegmentedControlController *)segmentedControlController didSelectViewController:(UIViewController *)viewController;

@end

@interface YYRSegmentedControlController : YYRViewController
@property (nonatomic, copy) NSArray *viewControllers;
@property (nonatomic, strong, readonly) UISegmentedControl *segmentedControl;
@property (nonatomic, assign) id<YYRSegmentedControlControllerDelegate> delegate;

@end

@interface UIViewController (YYRSegmentedControlItem)

@property (nonatomic, copy) NSString *segmentedControlItem;

@end
