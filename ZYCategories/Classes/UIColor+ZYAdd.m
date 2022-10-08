//
//  UIColor+ZYAdd.m
//  ZYCategories
//
//  Created by XUZY on 2022/2/8.
//

#import "UIColor+ZYAdd.h"

@implementation UIColor (ZYAdd)

+ (CAGradientLayer *)getGradualColorWithSize:(CGSize)size colors:(NSArray <UIColor *>*)colors colorDirection:(GradientColorDirection)colorDirection {
    return [self getGradualColorWithSize:size colors:colors colorDirection:colorDirection locations:@[@(0.0), @(1.0)]];
}

+ (CAGradientLayer *)getGradualColorWithSize:(CGSize)size colors:(NSArray <UIColor *>*)colors colorDirection:(GradientColorDirection)colorDirection locations:(NSArray <NSNumber *>*)locations {
    CGPoint startPoint;
    CGPoint endPoint;
    switch (colorDirection) {
        case GradientColorDirectionTopToBottom: //从上到下
            startPoint = CGPointMake(0.0, 0.0);
            endPoint = CGPointMake(0.0, 1.0);
            break;
        case GradientColorDirectionLeftToRight://从左到右
            startPoint = CGPointMake(0.0, 0.0);
            endPoint = CGPointMake(1.0, 0.0);
            break;
        case GradientColorDirectionLeftTopToRightBottom:// 从左上至右下
            startPoint = CGPointMake(0.0, 0.0);
            endPoint = CGPointMake(1.0, 1.0);
            break;
        case GradientColorDirectionLeftBottomToRightTop:// 从左下至右上
            startPoint = CGPointMake(0.0, 1.0);
            endPoint = CGPointMake(1.0, 0.0);
            break;
        default:
            break;
    }
    return [self getGradualColorWithSize:size colors:colors startPoint:startPoint endPoint:endPoint locations:locations];
}

//绘制渐变色颜色的方法
+ (CAGradientLayer *)getGradualColorWithSize:(CGSize)size colors:(NSArray <UIColor *>*)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint locations:(NSArray <NSNumber *>*)locations {

//    CAGradientLayer类对其绘制渐变背景颜色、填充层的形状(包括圆角)
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    
    gradientLayer.frame = CGRectMake(0, 0, size.width, size.height);
    
    NSMutableArray *mColors = [NSMutableArray array];
    for (NSInteger i = 0; i < colors.count; i++) {
        UIColor *color = colors[i];
        [mColors addObject:(__bridge id)color.CGColor];
    }

    // 设置渐变颜色数组
    gradientLayer.colors = mColors;

    // 设置渐变起始点
    gradientLayer.startPoint = startPoint;
    // 设置渐变结束点
    gradientLayer.endPoint = endPoint;

    // 设置渐变颜色分布区间，不设置则均匀分布 取值范围 0.0~1.0
     gradientLayer.locations = locations;
    // 设置渐变类型，不设置则按像素均匀变化
//     gradientLayer.type = kCAGradientLayerAxial;// 按像素均匀变化

    return gradientLayer;
}

@end
