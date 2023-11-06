//
//  NSObject+ZYAdd.m
//  ZYCategories
//
//  Created by XUZY on 2022/1/12.
//

#import "NSObject+ZYAdd.h"
#import <objc/runtime.h>

@implementation NSObject (ZYAdd)

- (void)setIsSelected:(BOOL)isSelected {
    objc_setAssociatedObject(self, @selector(isSelected), @(isSelected), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isSelected {
     return [objc_getAssociatedObject(self, @selector(isSelected)) boolValue];
}

- (void)setObjValue:(id)objValue {
    if (![objValue isKindOfClass:[NSNull class]]) {
        objc_setAssociatedObject(self, @selector(objValue), objValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (id)objValue {
     return objc_getAssociatedObject(self, @selector(objValue));
}

- (void)setTagString:(NSString *)tagString {
    objc_setAssociatedObject(self, @selector(tagString), tagString, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)tagString {
     return objc_getAssociatedObject(self, @selector(tagString));
}

@end
