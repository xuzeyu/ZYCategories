//
//  UIColor+ZYAdd.h
//  ZYCategories
//
//  Created by XUZY on 2022/2/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, GradientColorDirection) {
    GradientColorDirectionTopToBottom = 0,            //从上到下
    GradientColorDirectionLeftToRight,                //从左到右
    GradientColorDirectionLeftTopToRightBottom,       // 从左上至右下
    GradientColorDirectionLeftBottomToRightTop        // 从左下至右上
};

@interface UIColor (ZYAdd)
+ (CAGradientLayer *)getGradualColorWithSize:(CGSize)size colors:(NSArray <UIColor *>*)colors colorDirection:(GradientColorDirection)colorDirection;
+ (CAGradientLayer *)getGradualColorWithSize:(CGSize)size colors:(NSArray <UIColor *>*)colors colorDirection:(GradientColorDirection)colorDirection locations:(NSArray <NSNumber *>*)locations;
+ (CAGradientLayer *)getGradualColorWithSize:(CGSize)size colors:(NSArray <UIColor *>*)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint locations:(NSArray <NSNumber *>*)locations;
@end

NS_ASSUME_NONNULL_END
