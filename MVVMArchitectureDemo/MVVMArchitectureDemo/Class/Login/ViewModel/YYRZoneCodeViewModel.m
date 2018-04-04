//
//  YYRZoneCodeViewModel.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/4/3.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRZoneCodeViewModel.h"
#import "YYRCommonItemViewModel.h"

@interface YYRZoneCodeViewModel ()
/// closeCommand
@property (nonatomic, readwrite, strong) RACCommand *closeCommand;
@end
@implementation YYRZoneCodeViewModel

- (void)initialize {
    [super initialize];
    
    self.title = @"选择国家和地区";
    
    @weakify(self);
    self.closeCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        @strongify(self);
        [self.services dismissViewModelAnimated:YES completion:nil];
        return [RACSignal empty];
    }];
    
    self.didSelectCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(NSIndexPath *indexPath) {
        @strongify(self);
        /// 回调数据
        !self.callback ? : self.callback(self.dataSource[indexPath.section][indexPath.row]);
        [self.services dismissViewModelAnimated:YES completion:nil];
        return [RACSignal empty];
    }];
    
    self.shouldMultiSections = YES;
    // 加载plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Zone" ofType:@"plist"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSDictionary dictionaryWithPlistData:data];
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dict.count];
   
    NSArray *keys = [[dict allKeys] sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSComparisonResult result = [obj1 compare:obj2];
        return result == NSOrderedDescending;
    }];
    NSMutableArray *allKeys = [NSMutableArray arrayWithArray:keys];
    NSString *lastKey = [allKeys lastObject];
    [allKeys removeLastObject];
    [allKeys insertObject:lastKey atIndex:0];
    for (NSString *key in allKeys) {
        [arrM addObject:dict[key]];
    }
    NSMutableArray *arrM1 = [NSMutableArray arrayWithCapacity:arrM.count];
    for (NSArray *arr in arrM) {
        NSMutableArray *arrM2 = [NSMutableArray arrayWithCapacity:arr.count];
        for (NSDictionary *dict in arr) {
            YYRCommonItemViewModel *viewModel = [[YYRCommonItemViewModel alloc] init];
            viewModel.selectionStyle = UITableViewCellStyleValue1;
            viewModel.title = dict[@"country"];
            viewModel.subtitle = dict[@"code"];
            [arrM2 addObject:viewModel];
        }
        [arrM1 addObject:arrM2];
    }
    self.dataSource = arrM1.copy;
    self.headersArr = allKeys;
    
}

@end
