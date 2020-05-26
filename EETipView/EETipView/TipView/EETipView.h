//
//  EETipView.h
//  EETipView
//
//  Created by forthonliu(刘赋山) on 2020/5/26.
//  Copyright © 2020 forthonliu(刘赋山). All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, EETipArrowPosition) {
    EETipArrowPositionTopCenter = 1 << 0,
    EETipArrowPositionTopLeft = 1 << 1,
    EETipArrowPositionTopRight = 1 << 2,
    EETipArrowPositionBottomCenter = 1 << 3,
    EETipArrowPositionBottomLeft = 1 << 4,
    EETipArrowPositionBottomRight = 1 << 5,
    EETipArrowPositionBottom = EETipArrowPositionBottomLeft | EETipArrowPositionBottomCenter | EETipArrowPositionBottomRight,
    EETipArrowPositionTop = EETipArrowPositionTopLeft | EETipArrowPositionTopCenter | EETipArrowPositionTopRight,
    EETipArrowPositionLeft = EETipArrowPositionBottomLeft | EETipArrowPositionTopLeft,
    EETipArrowPositionRight = EETipArrowPositionBottomRight | EETipArrowPositionTopRight,
    EETipArrowPositionCenter = EETipArrowPositionBottomCenter | EETipArrowPositionTopCenter
};

@interface EETipView : UIView

@property (nonatomic, weak) UIView *targetView;

@property (nonatomic, strong) UIColor *tipBgColor;
@property (nonatomic, strong) UIColor *tipMsgColor;

- (void)showTips:(NSString *)tips
           duration:(CGFloat)interval;

- (void)showTips:(NSString *)tips
           duration:(CGFloat)interval
           position:(EETipArrowPosition)position;

- (void)showAttributeTips:(NSAttributedString *)attriTip
                    duration:(CGFloat)interval;

- (void)showAttributeTips:(NSAttributedString *)attriTip
                    duration:(CGFloat)interval
                    position:(EETipArrowPosition)position;

- (void)showTips:(NSString *)tips
       attributeTip:(NSAttributedString *)attriTip
           duration:(CGFloat)interval
           position:(EETipArrowPosition)position;

@end
