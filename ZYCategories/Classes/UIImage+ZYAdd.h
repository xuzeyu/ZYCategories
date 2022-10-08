//
//  UIImage+ZYAdd.h
//  ZYCategories
//
//  Created by XUZY on 2022/1/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, GradientImageDirection) {
    GradientImageDirectionTopToBottom = 0,            //从上到下
    GradientImageDirectionLeftToRight,                //从左到右
    GradientImageDirectionLeftTopToRightBottom,       //从左上到右下
    GradientImageDirectionLeftBottomToRightTop        //从左下到右上
};

@interface UIImage (ZYAdd)
//压缩图片
+ (UIImage *)scaleImage:(UIImage *)image scaleFactor:(float)scaleFloat;

/**
 *  根据给定的颜色，生成渐变色的图片
 *  @param imageSize        要生成的图片的大小
 *  @param colorArr         渐变颜色的数组
 *  @param percents          渐变颜色的占比数组
 *  @param gradientDirection     渐变色的类型
 */
+ (UIImage *)getGradientImageWithSize:(CGSize)imageSize gradientColors:(NSArray <UIColor *>*)gradientColors percents:(NSArray <NSNumber *>*)percents gradientDirection:(GradientImageDirection)gradientDirection;

@end

NS_ASSUME_NONNULL_END
