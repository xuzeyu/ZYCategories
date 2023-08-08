//
//  NSString+ZYAdd.h
//  ZYCategories
//
//  Created by XUZY on 2022/1/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ZYAdd)
+ (BOOL)isPureInt:(NSString*)text;///<是否为整形
+ (BOOL)isPureFloat:(NSString*)text;///<是否为浮点数
@end

NS_ASSUME_NONNULL_END
