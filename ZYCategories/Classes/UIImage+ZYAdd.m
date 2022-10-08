//
//  UIImage+ZYAdd.m
//  ZYCategories
//
//  Created by XUZY on 2022/1/17.
//

#import "UIImage+ZYAdd.h"

@implementation UIImage (ZYAdd)

+ (UIImage *)scaleImage:(UIImage *)image scaleFactor:(float)scaleFloat
{
    if (!image) return nil;
    CGSize size = CGSizeMake(image.size.width *scaleFloat, image.size.height *scaleFloat);
    
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    transform = CGAffineTransformScale(transform, scaleFloat, scaleFloat);
    CGContextConcatCTM(context, transform);
    
    // Draw the image into the transformed context and return the image
    [image drawAtPoint:CGPointMake(0.0f, 0.0f)];
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimg;
}

+ (UIImage *)getGradientImageWithSize:(CGSize)imageSize gradientColors:(NSArray <UIColor *>*)gradientColors percents:(NSArray <NSNumber *>*)percents gradientDirection:(GradientImageDirection)gradientDirection {
    
    NSMutableArray *ar = [NSMutableArray array];
    for(UIColor *c in gradientColors) {
        [ar addObject:(id)c.CGColor];
    }
    
//    NSUInteger capacity = percents.count;
//    CGFloat locations[capacity];
    NSInteger percentsCount = percents.count;
    CGFloat locations[percentsCount];
    for (int i = 0; i < percentsCount; i++) {
        locations[i] = [percents[i] floatValue];
    }
    
    
    UIGraphicsBeginImageContextWithOptions(imageSize, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[gradientColors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, locations);
    CGPoint start;
    CGPoint end;
    switch (gradientDirection) {
        case GradientImageDirectionTopToBottom:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, imageSize.height);
            break;
        case GradientImageDirectionLeftToRight:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imageSize.width, 0.0);
            break;
        case GradientImageDirectionLeftTopToRightBottom:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imageSize.width, imageSize.height);
            break;
        case GradientImageDirectionLeftBottomToRightTop:
            start = CGPointMake(0.0, imageSize.height);
            end = CGPointMake(imageSize.width, 0.0);
            break;
        default:
            break;
    }
    
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    
    return image;
}

@end
