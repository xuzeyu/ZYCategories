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

- (void)setValue:(id)value {
    objc_setAssociatedObject(self, @selector(value), value, OBJC_ASSOCIATION_ASSIGN);
}

- (id)value {
     return objc_getAssociatedObject(self, @selector(value));
}

- (void)setTagString:(NSString *)tagString {
    objc_setAssociatedObject(self, @selector(tagString), tagString, OBJC_ASSOCIATION_ASSIGN);
}

- (NSString *)tagString {
     return objc_getAssociatedObject(self, @selector(tagString));
}

@end
