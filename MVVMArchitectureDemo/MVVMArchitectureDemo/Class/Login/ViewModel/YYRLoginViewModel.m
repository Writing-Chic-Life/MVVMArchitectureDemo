//
//  YYRLoginViewModel.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/4/2.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRLoginViewModel.h"
#import "YYRZoneCodeViewModel.h"
#import "YYRWebViewModel.h"
#import "YYRUser.h"

#import "YYRCommonItemViewModel.h"

@interface YYRLoginViewModel ()

/// closeCommand
@property (nonatomic, readwrite, strong) RACCommand *closeCommand;
/// loginCommand
@property (nonatomic, readwrite, strong) RACCommand *loginCommand;
/// selelctZoneComand
@property (nonatomic, readwrite, strong) RACCommand *selelctZoneComand;
/// error （PS；这个记录请求过程中的发生的错误，请求之前必须置nil）
@property (nonatomic, readwrite, strong) NSError *error;
/// 更多命令
@property (nonatomic, readwrite, strong) RACCommand *moreCommand;
/// 登录按钮有效性
@property (nonatomic, readwrite, strong) RACSignal *validLoginSignal;

@end
@implementation YYRLoginViewModel

- (void)initialize {
    [super initialize];
    
    @weakify(self);
    self.closeCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self);
        [self.services dismissViewModelAnimated:YES completion:NULL];
        return [RACSignal empty];
    }];
    
    /// 更多命令
    self.moreCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(NSNumber *index) {
        @strongify(self);
        YYRViewModel *viewModel = nil;
        if (index.integerValue == 1) { // 找回密码
            NSURL *url = [NSURL URLWithString:YYRMyBlogHomepageUrl];
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            YYRWebViewModel * webViewModel = [[YYRWebViewModel alloc] initWithServices:self.services params:@{YYRViewModelRequestKey:request}];
            /// 去掉关闭按钮
            webViewModel.shouldDisableWebViewClose = YES;
            viewModel = webViewModel;
        } else if (index.integerValue == 2) { // 前往微信安全中心
            NSURL *url = [NSURL URLWithString:YYRMyBlogHomepageUrl];
            NSURLRequest *request = [NSURLRequest requestWithURL:url];
            YYRWebViewModel * webViewModel = [[YYRWebViewModel alloc] initWithServices:self.services params:@{YYRViewModelRequestKey:request}];
            /// 去掉关闭按钮
            webViewModel.shouldDisableWebViewClose = YES;
            viewModel = webViewModel;
        }
        if (viewModel) [self.services presentViewModel:viewModel animated:YES completion:nil];
        return [RACSignal empty];
    }];
    
    /// 登录命令
    void (^donNext)(YYRUser *) = ^(YYRUser *user) {
        @strongify(self);
        /// 存储登录账户
        [SAMKeychain setRawLogin:self.account];
        
        /// 存储用户数据
        [[self.services client] loginUser:user];
        
        /// 切换根控制器
        dispatch_async(dispatch_get_main_queue(), ^{
           /// 发通知
            [[NSNotificationCenter defaultCenter] postNotificationName:YYRSwitchRootViewControllerNotification object:nil userInfo:@{YYRSwitchRootViewControllerUserInfoKey: @(YYRSwitchRootViewControllerFromTypeLogin)}];
        });
    };
    
    self.loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(NSNumber *selected) {
        @strongify(self);
        /// 判断QQ登录 还是 手机号登录
        if (selected.boolValue) { // QQ登录/微信号/邮箱
            /// 发起请求去登录 self.account + self.password
            /// 将self.error = nil;
            self.error = nil;
            return [[self _fetchUserInfo] doNext:donNext];
        }
        
        return [RACSignal empty];
    }];
    
    self.selelctZoneComand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self);
        YYRZoneCodeViewModel *viewModel = [[YYRZoneCodeViewModel alloc] initWithServices:self.services params:nil];
        [self.services presentViewModel:viewModel animated:YES completion:NULL];
        
        /// 设置block
        @weakify(self);
        viewModel.callback = ^(YYRCommonItemViewModel *viewModel) {
            @strongify(self);
            self.zoneCode = viewModel.subtitle;
            self.zoneName = viewModel.title;
            
            // “手动触发self.dataSource的KVO”，必写。
            [self willChangeValueForKey:@"zoneCode"];
            // “手动触发self.now的KVO”，必写。
            [self didChangeValueForKey:@"zoneCode"];
            
            [self willChangeValueForKey:@"zoneName"];
            // “手动触发self.now的KVO”，必写。
            [self didChangeValueForKey:@"zoneName"];
        };
        
        return [RACSignal empty];
    }];
    
   
    
    /// 按钮的有效性
    self.validLoginSignal = [[RACSignal combineLatest:@[RACObserve(self, account), RACObserve(self, password), RACObserve(self, phone), RACObserve(self, selected)] reduce:^(NSString *account, NSString *password , NSString *phone , NSNumber *selected) {
        if (selected.boolValue) {
            return @(YYRStringIsNotEmpty(account) && YYRStringIsNotEmpty(password));
        } else {
            return @(YYRStringIsNotEmpty(phone));
        }
    }] distinctUntilChanged];
}

#pragma mark - 辅助方法
- (RACSignal *) _fetchUserInfo {
    @weakify(self);
    return [[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        @strongify(self);
        @weakify(self);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            @strongify(self);
            /// 假设请求到数据模型是  YYRUser模型
            YYRUser *user = [[YYRUser alloc] init];
            user.screenName = @"YYR-yyr";
            user.idstr = @"61856069";
            user.profileImageUrl = [NSURL URLWithString:@"http://tva3.sinaimg.cn/crop.0.6.264.264.180/93276e1fjw8f5c6ob1pmpj207g07jaa5.jpg"];
            /// 用户的封面
            user.coverImageUrl = [NSURL URLWithString:@"http://p1.gexing.com/G1/M00/7A/83/rBACE1TW-cjDb2yHAAGORXsJM6w706.jpg"];
            
            /// 假设是这里统一都是qq号码登录
            user.qq = self.account;
            user.email = [NSString stringWithFormat:@"%@@qq.com",user.qq];       // PS：机智，拼接成QQ邮箱
            user.wechatId = @"codermikehe";             // PS：瞎写的
            user.phone = @"13874385438";                // PS：瞎写的
            user.channel = YYRUserLoginChannelTypeQQ;    // QQ登录
            [subscriber sendNext:user];
            /// 必须sendCompleted 否则command.executing一直为1 导致HUD 一直 loading
            [subscriber sendCompleted];
        });
        return [RACDisposable disposableWithBlock:^{
            /// 取消任务
        }];
    }] doError:^(NSError * _Nonnull error) {
        @strongify(self);
        self.error = error;
    }];
}

@end
