//
//  EETipView.m
//  EETipView
//
//  Created by forthonliu(刘赋山) on 2020/5/26.
//  Copyright © 2020 forthonliu(刘赋山). All rights reserved.
//

#import "EETipView.h"
#import <objc/runtime.h>
#import "EETipArrowView.h"

static const CGFloat kEETipSpaceingValue = 5.0f;

@interface EETipView ()



@end

@implementation EETipView

- (void)showTips:(NSString *)tips
        duration:(CGFloat)interval
{
    [self showTips:tips duration:interval position:EETipArrowPositionTopCenter];
}

- (void)showTips:(NSString *)tips
           duration:(CGFloat)interval
           position:(EETipArrowPosition)position
{
    [self showTips:tips attributeTip:nil duration:interval position:position];
}

- (void)showAttributeTips:(NSAttributedString *)attriTip
                 duration:(CGFloat)interval
{
    [self showAttributeTips:attriTip duration:interval position:EETipArrowPositionTopCenter];
}

- (void)showAttributeTips:(NSAttributedString *)attriTip
                 duration:(CGFloat)interval
                 position:(EETipArrowPosition)position
{
     [self showTips:nil attributeTip:attriTip duration:interval position:position];
}

- (void)showTips:(NSString *)tips
       attributeTip:(NSAttributedString *)attriTip
           duration:(CGFloat)interval
           position:(EETipArrowPosition)position
{
    
    UIColor *bgColor = [self getTipBgColor];
    UIColor *msgColor = [self getTipMsgColor];
    
    EETipArrowView *arrowImage = [[EETipArrowView alloc] initWithColor:bgColor];
    UIView *tipsView = [[UIView alloc] init];
    [self addSubview:tipsView];
    
    [tipsView addSubview:arrowImage];
//    [arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(10, 5));
//    }];
//
//    UIView *msgView = [UIView new];
//    msgView.backgroundColor = bgColor;
//    msgView.layer.cornerRadius = 8.0;
//    msgView.clipsToBounds = YES;
//    [tipsView addSubview:msgView];
//    [msgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(tipsView);
//    }];
//
//    UILabel *titleLabel = [UILabel new];
//    titleLabel.textColor = msgColor;
//    titleLabel.font = F(12.0f);
//    titleLabel.numberOfLines = 0;
//    titleLabel.textAlignment = NSTextAlignmentCenter;
//    [msgView addSubview:titleLabel];
//    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(msgView).with.offset(10);
//        make.right.equalTo(msgView).with.offset(-10);
//        make.top.equalTo(msgView).with.offset(8);
//        make.bottom.equalTo(msgView).with.offset(-8);
//    }];
    
//    if (tips) {
//         titleLabel.text = tips;
//    }
//    if (attriTip) {
//         titleLabel.attributedText = attriTip;
//    }
//
//    if (interval > 0) {
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(interval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [tipsView removeFromSuperview];
//        });
//    }
//
//    [self setMsgView:msgView];
//    [self setTipsView:tipsView];
//    [self setArrowView:arrowImage];
//
//    [self p_configTipsConstraintByPosition:position];
//    [self p_configTipsArrowConstraintByPosition:position];
}

//- (void)p_configTipsConstraintByPosition:(EETipArrowPosition)position
//{
//    UIView *tipsView = [self getTipsView];
//
//    [tipsView mas_makeConstraints:^(MASConstraintMaker *make) {
//        if (position & EETipArrowPositionTop) {
//            make.top.mas_equalTo(self.mas_bottom).offset(kTipSpaceingValue);
//        }
//        else if (position & EETipArrowPositionBottom) {
//            make.bottom.mas_equalTo(self.mas_top).offset(-kTipSpaceingValue);
//        }
//
//        if (position & EETipArrowPositionCenter) {
//            make.centerX.equalTo(self);
//        }
//        else if (position & EETipArrowPositionLeft) {
//            make.left.mas_equalTo(self.mas_centerX).offset(-25);
//        }
//        else if (position & EETipArrowPositionRight) {
//            make.right.mas_equalTo(self.mas_centerX).offset(25);
//        }
//    }];
//}
//
//- (void)p_configTipsArrowConstraintByPosition:(EETipArrowPosition)position
//{
//    UIView *msgView = [self getMsgView];
//    UIView *tipsView = [self getTipsView];
//    EETipArrowView *arrowView = [self getArrowView];
//
//    MASConstraintMaker *msgMaker = [[MASConstraintMaker alloc] initWithView:msgView];
//    msgMaker.updateExisting = YES;
//    MASConstraintMaker *arrowMaker = [[MASConstraintMaker alloc] initWithView:arrowView];
//    arrowMaker.updateExisting = YES;
//
//    if (position == EETipArrowPositionTopLeft) {
//        arrowMaker.left.equalTo(tipsView).with.offset(20);
//        arrowMaker.top.equalTo(tipsView);
//        msgMaker.top.equalTo(arrowView.mas_bottom);
//        msgMaker.bottom.equalTo(tipsView);
//    }
//    else if (position == EETipArrowPositionTopRight) {
//        arrowMaker.right.equalTo(tipsView).with.offset(-20);
//        arrowMaker.top.equalTo(tipsView);
//        msgMaker.top.equalTo(arrowView.mas_bottom);
//        msgMaker.bottom.equalTo(tipsView);
//    }
//    else if (position == EETipArrowPositionTopCenter) {
//        arrowMaker.centerX.equalTo(tipsView);
//        arrowMaker.top.equalTo(tipsView);
//        msgMaker.top.equalTo(arrowView.mas_bottom);
//        msgMaker.bottom.equalTo(tipsView);
//    }
//    else if (position == EETipArrowPositionBottomLeft) {
//        [arrowView changeToType:PKArrowTypeDown];
//        msgMaker.top.equalTo(tipsView);
//        arrowMaker.top.equalTo(msgView.mas_bottom);
//        arrowMaker.bottom.equalTo(tipsView);
//        arrowMaker.left.equalTo(tipsView).with.offset(20);
//    }
//    else if (position == EETipArrowPositionBottomRight) {
//        [arrowView changeToType:PKArrowTypeDown];
//        msgMaker.top.equalTo(tipsView);
//        arrowMaker.top.equalTo(msgView.mas_bottom);
//        arrowMaker.bottom.equalTo(tipsView);
//        arrowMaker.right.equalTo(tipsView).with.offset(-20);
//    }
//    else if (position == EETipArrowPositionBottomCenter) {
//        [arrowView changeToType:PKArrowTypeDown];
//        msgMaker.top.equalTo(tipsView);
//        arrowMaker.top.equalTo(msgView.mas_bottom);
//        arrowMaker.bottom.equalTo(tipsView);
//        arrowMaker.centerX.equalTo(tipsView);
//    }
//    [msgMaker install];
//    [arrowMaker install];
//}

//- (void)setMsgView:(UIView *)msgView
//{
//    objc_setAssociatedObject(self, &kMsgViewTag, msgView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (UIView *)getMsgView
//{
//    return objc_getAssociatedObject(self, &kMsgViewTag);
//}
//
//- (void)setTipsView:(UIView *)tipsView
//{
//    objc_setAssociatedObject(self, &kTipsViewTag, tipsView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (UIView *)getTipsView
//{
//    return objc_getAssociatedObject(self, &kTipsViewTag);
//}
//
//- (void)setArrowView:(EETipArrowView *)arrowView
//{
//    objc_setAssociatedObject(self, &kArrowViewTag, arrowView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (EETipArrowView *)getArrowView
//{
//    return objc_getAssociatedObject(self, &kArrowViewTag);
//}
//
//- (void)setTipMsgColor:(UIColor *)msgColor
//{
//    objc_setAssociatedObject(self, &kMsgColor, msgColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (UIColor *)getTipMsgColor
//{
//    UIColor *color = objc_getAssociatedObject(self, &kMsgColor);
//    return color ? color : [UIColor whiteColor];
//}
//
//- (void)setTipBgColor:(UIColor *)bgColor
//{
//    objc_setAssociatedObject(self, &kBgColor, bgColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//- (UIColor *)getTipBgColor
//{
//    UIColor *color = objc_getAssociatedObject(self, &kBgColor);
//    return color ? color : [UIColor blackColor];
//}


@end
