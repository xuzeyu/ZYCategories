//
//  NSObject+ZYAdd.m
//  ZYCategories
//
//  Created by XUZY on 2022/1/12.
//

#import "NSObject+ZYAdd.h"
#import <objc/runtime.h>

@implementation NSObject (ZYAdd)

- (void)setTagString:(NSString *)tagString {
    objc_setAssociatedObject(self, @selector(tagString), tagString, OBJC_ASSOCIATION_ASSIGN);
}

- (NSString *)tagString {
     return objc_getAssociatedObject(self, @selector(tagString));
}

@end
