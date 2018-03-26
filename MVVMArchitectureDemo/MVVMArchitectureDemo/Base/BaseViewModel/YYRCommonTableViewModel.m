//
//  YYRCommonTableViewModel.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/26.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRCommonTableViewModel.h"

@implementation YYRCommonTableViewModel

- (void)initialize{
    [super initialize];
    
    @weakify(self);
    /// 选中cell的命令
    /// UI Test
    self.didSelectCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(NSIndexPath *indexPath) {
        @strongify(self);
        YYRCommonGroupViewModel *groupViewModel = self.dataSource[indexPath.section] ;
        YYRCommonItemViewModel *itemViewModel = groupViewModel.itemViewModels[indexPath.row];
        
        if (itemViewModel.operation) {
            /// 有操作执行操作
            itemViewModel.operation();
        }else if(itemViewModel.destViewModelClass){
            /// 没有操作就跳转VC
            Class viewModelClass = itemViewModel.destViewModelClass;
            YYRViewModel *viewModel = [[viewModelClass alloc] initWithServices:self.services params:@{YYRViewModelTitleKey:itemViewModel.title}];
            [self.services pushViewModel:viewModel animated:YES];
        }
        return [RACSignal empty];
    }];
}


@end
