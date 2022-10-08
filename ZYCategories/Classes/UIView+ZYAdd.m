//
//  UIView+ZYAdd.m
//  ZYCategories
//
//  Created by XUZY on 2022/1/12.
//

#import "UIView+ZYAdd.h"

@implementation UIView (ZYAdd)

- (UIImage *)screenshot {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (__kindof UIView *(^)(NSString *))subview {
    __weak UIView *__self = self;
    return ^UIView *(NSString *tagString) {
        return [__self viewWithTagString:tagString];
    };
}

- (__kindof UIView *)viewWithTagString:(NSString *)tagString {
    if (!tagString.length)
        return nil;
    
    for (UIView *subview in self.subviews) {
        if ([subview.tagString isEqualToString:tagString])
            return subview;
        
        UIView *v = [subview viewWithTagString:tagString];
        if (v)
            return v;
    }
    return nil;
}

- (UIView *)superviewWithTagString:(NSString *)tagString {
    UIView *superview = self.superview;
    while (superview) {
        if ([superview.tagString isEqualToString:tagString])
            return superview;
        superview = superview.superview;
    }
    return nil;
}

- (BOOL)existSubview:(UIView *)view {
    return view != self && [view isDescendantOfView:self];
}

- (BOOL)existSuperview:(UIView *)view {
    return view != self && [self isDescendantOfView:view];
}

- (UIView*)subViewOfClassName:(NSString*)className {
    for (UIView* subView in self.subviews) {
        if ([NSStringFromClass(subView.class) isEqualToString:className]) {
            return subView;
        }
        
        UIView* resultFound = [subView subViewOfClassName:className];
        if (resultFound) {
            return resultFound;
        }
    }
    return nil;
}

#pragma mark - Frame
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

-(void)setBx:(CGFloat)bx {
    self.x = bx-self.width;
}

-(CGFloat)bx {
    return self.x+self.width;
}

-(void)setBy:(CGFloat)by {
    self.y = by-self.height;
}

-(CGFloat)by {
    return self.y+self.height;
}


- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}


// Miu 控件之间对齐用
- (CGFloat)centerX
{
    return self.center.x;
}
- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint newcenter = self.center;
    newcenter.x = centerX;
    self.center = newcenter;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint newcenter = self.center;
    newcenter.y = centerY;
    self.center = newcenter;
}
@end
