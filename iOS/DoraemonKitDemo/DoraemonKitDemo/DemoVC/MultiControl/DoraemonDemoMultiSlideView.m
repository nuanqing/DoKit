//
//  DoraemonDemoMultiSlideView.m
//  DoraemonKitDemo
//
//  Created by wzp on 2021/8/24.
//  Copyright © 2021 yixiang. All rights reserved.
//

#import "DoraemonDemoMultiSlideView.h"
#import <Masonry/Masonry.h>
typedef void(^CommonActionBlock)(id);
@interface DoraemonDemoMultiSlideView ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *slideView;
@property (nonatomic, strong) UIButton *slideButton;
@property (nonatomic, assign) CGFloat fMaxSlideValue;
@property (nonatomic, strong) UILabel *lbLockName;
@property (nonatomic, assign) int nUnlockScale;
@property (nonatomic, strong) CommonActionBlock unLockBlock;
@end

@implementation DoraemonDemoMultiSlideView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        _nUnlockScale = 70;    // 默认百分之七十
        
        _bgView = [UIView new];
        [_bgView setBackgroundColor:[UIColor redColor]];
        _bgView.layer.cornerRadius = 12;
        _bgView.clipsToBounds = YES;
        [self addSubview:_bgView];
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        //
        _slideView = [UIView new];
        [_slideView setBackgroundColor:[UIColor grayColor]];
        _slideView.layer.cornerRadius = 12;
        [_bgView addSubview:_slideView];
        [_slideView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.bgView);
        }];
        //
        _slideButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_slideButton setBackgroundColor:[UIColor orangeColor]];
        [_slideView addSubview:_slideButton];
        [_slideButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.top.bottom.equalTo(self.slideView);
            make.width.equalTo(@(50));
        }];

        UIFont *font = [UIFont systemFontOfSize:24];
        _lbLockName = [UILabel new];
        [_lbLockName setBackgroundColor:[UIColor grayColor]];
        [_lbLockName setText:@"自定义事件"];
        [_lbLockName setTextColor:[UIColor whiteColor]];
        [_lbLockName setTextAlignment:NSTextAlignmentCenter];
        [_lbLockName setFont:font];
        [_slideView addSubview:_lbLockName];
        [_lbLockName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.slideView).offset(118);
            make.trailing.equalTo(self.slideView).offset(-80);
            make.height.equalTo(@(80));
            make.center.equalTo(self.slideView);
        }];
        
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(performPanGestureRecognizer:)];
        panGestureRecognizer.delegate = self;
        [_slideButton addGestureRecognizer:panGestureRecognizer];
    }
    
    return self;
}


- (void)setNUnlockScale:(int)nUnlockScale
{
    if(nUnlockScale < 0 ){
        nUnlockScale = 0;
    }else if(nUnlockScale > 100){
        nUnlockScale = 100;
    }
    _nUnlockScale = nUnlockScale;
}



- (void)performPanGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer
{
    
}

@end
