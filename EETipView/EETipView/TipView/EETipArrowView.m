//
//  EETipView.h
//  EETipView
//
//  Created by forthonliu(刘赋山) on 2020/5/26.
//  Copyright © 2020 forthonliu(刘赋山). All rights reserved.
//

#import "EETipArrowView.h"

@interface EETipArrowView ()
@property (nonatomic, strong) UIColor *arrowColor;
@property (nonatomic, assign) EETipArrowType arrorType;
@end

@implementation EETipArrowView

- (instancetype)initWithColor:(UIColor *)color
{
    return [self initWithColor:color type:EETipArrowTypeUp];
}

- (instancetype)initWithColor:(UIColor *)color type:(EETipArrowType)type
{
    if (self = [super initWithFrame:CGRectZero]) {
        self.opaque = NO;
        _arrowColor = color;
        _arrorType = type;
    }
    return self;
}

- (void)changeToType:(EETipArrowType)type
{
    _arrorType = type;
    [self layoutIfNeeded];
}

- (NSArray *)points
{
    CGSize size = self.bounds.size;
    CGPoint cPoint = CGPointZero;
    CGPoint lPoint = CGPointZero;
    CGPoint rPoint = CGPointZero;
    
    switch (self.arrorType) {
        case EETipArrowTypeUp: {
            cPoint = CGPointMake(size.width*0.5, 0);
            lPoint = CGPointMake(0, size.height);
            rPoint = CGPointMake(size.width, size.height);
            break;
        }
        case EETipArrowTypeDown: {
            cPoint = CGPointMake(size.width*0.5, 0);
            lPoint = CGPointMake(0, size.height);
            rPoint = CGPointMake(size.width, size.height);
            break;
        }
        case EETipArrowTypeLeft: {
            cPoint = CGPointMake(size.width*0.5, 0);
            lPoint = CGPointMake(0, size.height);
            rPoint = CGPointMake(size.width, size.height);
            break;
        }
        default: {
            cPoint = CGPointMake(size.width*0.5, 0);
            lPoint = CGPointMake(0, size.height);
            rPoint = CGPointMake(size.width, size.height);
            break;
        }
    }
    
    return @[[NSValue valueWithCGPoint:cPoint],
             [NSValue valueWithCGPoint:lPoint],
             [NSValue valueWithCGPoint:rPoint]];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    [[UIColor clearColor] set];
    UIRectFill([self bounds]);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
    CGContextBeginPath(context);
    
    NSArray *points = [self points];
    CGPoint cPoint = [points[0] CGPointValue];
    CGPoint lPoint = [points[1] CGPointValue];
    CGPoint rPoint = [points[2] CGPointValue];
    CGContextMoveToPoint(context, cPoint.x, cPoint.y);
    CGContextAddLineToPoint(context, lPoint.x, lPoint.y);
    CGContextAddLineToPoint(context, rPoint.x, rPoint.y);
    
    CGContextClosePath(context);
    [self.arrowColor setFill];
    [self.arrowColor setStroke];
    CGContextDrawPath(context, kCGPathFillStroke);
}

@end
