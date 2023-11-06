//
//  NSObject+ZYAdd.h
//  ZYCategories
//
//  Created by XUZY on 2022/1/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ZYAdd)
@property (nonatomic, assign) BOOL isSelected;
@property (nonatomic, strong) id objValue;///<存一些额外参数值
@property (nonatomic, copy) IBInspectable NSString *tagString;///<tag字符串
@end

NS_ASSUME_NONNULL_END
