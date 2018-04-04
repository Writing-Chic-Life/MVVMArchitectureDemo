//
//  YYRBootLoginViewModel.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/30.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRBootLoginViewModel.h"
#import "YYRLoginViewModel.h"
//#import "YYRRegisterViewModel.h"
//#import "YYRLanguageViewModel.h

@interface YYRBootLoginViewModel ()

/// loginCommand
@property (nonatomic, readwrite, strong) RACCommand *loginCommand;
/// registerCommand
@property (nonatomic, readwrite, strong) RACCommand *registerCommand;
/// languageCommand
@property (nonatomic, readwrite, strong) RACCommand *languageCommand;

/// language
@property (nonatomic, readwrite, copy) NSString *language;
/// languageIdstr
@property (nonatomic, readwrite, copy) NSString *languageIdstr;

@end
@implementation YYRBootLoginViewModel

- (void)initialize{
    [super initialize];
    /// 隐藏导航条
    self.prefersNavigationBarHidden = YES;
    
    /// 先从偏好设置里面取出languageIdstr
    NSString *language = [YYRPreferenceSettingHelper objectForKey:YYRPreferenceSettingLanguage];
    if (language) {
        NSArray *array = [language componentsSeparatedByString:@"-"];
        self.language = array.firstObject;
        self.languageIdstr = array.lastObject;
    } else {
        self.language = @"简体中文";
        self.languageIdstr = @"1000";
    }
    
    
    @weakify(self);
    self.loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        YYRLoginViewModel *viewModel = [[YYRLoginViewModel alloc] initWithServices:self.services params:nil];
        [self.services presentViewModel:viewModel animated:YES completion:NULL];
        return [RACSignal empty];
    }];
    
    self.registerCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
//        YYRRegisterViewModel *viewModel = [[YYRRegisterViewModel alloc] initWithServices:self.services params:nil];
//        [self.services presentViewModel:viewModel animated:YES completion:NULL];
        return [RACSignal empty];
    }];
    
    self.languageCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
//        YYRLanguageViewModel *viewModel = [[YYRLanguageViewModel alloc] initWithServices:self.services params:@{YYRViewModelIDKey:self.languageIdstr}];
//        [self.services presentViewModel:viewModel animated:YES completion:NULL];
        
        /// 回调
//        viewModel.callback = ^(YYRLanguageItemViewModel * itemViewModel) {
//            @strongify(self);
//            self.language = itemViewModel.title;
//            self.languageIdstr = itemViewModel.idstr;
//            /// 存储到偏好设置
//            [YYRPreferenceSettingHelper setObject:[NSString stringWithFormat:@"%@-%@",self.language , self.languageIdstr] forKey:YYRPreferenceSettingLanguage];
//        };
        
        return [RACSignal empty];
    }];
}

@end
