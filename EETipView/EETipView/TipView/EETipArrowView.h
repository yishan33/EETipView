//
//  EETipView.h
//  EETipView
//
//  Created by forthonliu(刘赋山) on 2020/5/26.
//  Copyright © 2020 forthonliu(刘赋山). All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, EETipArrowType) {
    EETipArrowTypeUp = 0,
    EETipArrowTypeDown = 1,
    EETipArrowTypeLeft = 2,
    EETipArrowTypeRight = 3
};

@interface EETipArrowView : UIView

- (instancetype)initWithColor:(UIColor *)color;
- (instancetype)initWithColor:(UIColor *)color type:(EETipArrowType)type;

- (void)changeToType:(EETipArrowType)type;

@end
