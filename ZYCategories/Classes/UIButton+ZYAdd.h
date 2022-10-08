//
//  UIButton+ZYAdd.h
//  ZYCategories
//
//  Created by XUZY on 2022/1/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/** 增大按钮的可点击区域，小于44*44的，变大为44*44 */
@interface UIButton (ZYAdd)
@property (nonatomic, assign) CGFloat minClickRange;
@end

NS_ASSUME_NONNULL_END
