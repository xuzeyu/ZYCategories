//
//  NSString+ZYAdd.m
//  ZYCategories
//
//  Created by XUZY on 2022/1/12.
//

#import "NSString+ZYAdd.h"
#import <objc/runtime.h>
@implementation NSString (ZYAdd)
//判断是否为整形
+ (BOOL)isPureInt:(NSString*)text {
    if (text.length > 0 && [text isKindOfClass:[NSString class]]) {
        NSScanner *scan = [NSScanner scannerWithString:text];
        int val;
        return [scan scanInt:&val] && [scan isAtEnd];
    }
    return NO;
}


//判断字符串是否为浮点数
+ (BOOL)isPureFloat:(NSString*)text {
    if (text.length > 0 && [text isKindOfClass:[NSString class]]) {
        NSScanner *scan = [NSScanner scannerWithString:text];
        float val;
        return [scan scanFloat:&val] && [scan isAtEnd];
    }
    return NO;
}
@end
