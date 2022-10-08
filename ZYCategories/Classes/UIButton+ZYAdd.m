//
//  UIButton+ZYAdd.m
//  ZYCategories
//
//  Created by XUZY on 2022/1/12.
//

#import "UIButton+ZYAdd.h"
#import <objc/runtime.h>
@implementation UIButton (ZYAdd)
/** 增大按钮的可点击区域，小于44*44的，变大为44*44 */
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event
{
    CGFloat minClickRange = self.minClickRange;//最小可点击区域
    CGRect bounds = self.bounds;
    if (bounds.size.width < minClickRange && bounds.size.height < minClickRange) { //都小于44才生效
        CGFloat widthDelta = minClickRange - bounds.size.width;
        CGFloat heightDelta = minClickRange - bounds.size.height;
        bounds = CGRectInset(bounds, -0.5* widthDelta, -0.5* heightDelta);//注意这里是负数，扩大了之前的bounds的范围
    }
    return CGRectContainsPoint(bounds, point);
}

- (CGFloat)minClickRange {
    if ([objc_getAssociatedObject(self, @selector(minClickRange)) floatValue] < 44.0f) { //最小可点击区域
        return 44.0f;
    }
    return [objc_getAssociatedObject(self, @selector(minClickRange)) floatValue];
}

- (void)setMinClickRange:(CGFloat)minClickRange {
    objc_setAssociatedObject(self, @selector(minClickRange), @(minClickRange), OBJC_ASSOCIATION_COPY_NONATOMIC);
}
@end
