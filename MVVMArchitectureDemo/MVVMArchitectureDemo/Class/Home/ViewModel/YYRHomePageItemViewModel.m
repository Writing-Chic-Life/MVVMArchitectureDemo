//
//  YYRHomePageItemViewModel.m
//  MVVMArchitectureDemo
//
//  Created by 袁应荣 on 2018/3/28.
//  Copyright © 2018年 袁应荣. All rights reserved.
//

#import "YYRHomePageItemViewModel.h"

@interface YYRHomePageItemViewModel ()
/// LiveRoom
@property (nonatomic, readwrite, strong) YYRLiveRoom *liveRoom;
/// cellHeight
@property (nonatomic, readwrite, assign) CGFloat cellHeight;
/// girlStar
@property (nonatomic, readwrite, copy) NSString *girlStar;
/// 观众人数
@property (nonatomic, readwrite, copy) NSAttributedString *allNumAttr;
@end
@implementation YYRHomePageItemViewModel

- (instancetype)initWithLiveRoom:(YYRLiveRoom *)liveRoom{
    if (self = [super init]) {
        self.liveRoom = liveRoom;
        
        self.girlStar = [NSString stringWithFormat:@"girl_star%zd_40x19",liveRoom.starlevel];
        
        NSMutableAttributedString *allNumAttr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@人在看",liveRoom.allnum]];
        allNumAttr.yy_font = YYRRegularFont_17;
        allNumAttr.yy_color = YYRColorFromHexString(@"#999999");
        allNumAttr.yy_alignment = NSTextAlignmentRight;
        [allNumAttr yy_setColor:YYRColorFromHexString(@"#F14F94") range:NSMakeRange(0, liveRoom.allnum.length)];
        self.allNumAttr = allNumAttr.copy;
        
        self.cellHeight = 50 + YYR_SCREEN_WIDTH + 7;
    }
    return self;
}

@end
