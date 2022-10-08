//
//  UIView+ZYAdd.h
//  ZYCategories
//
//  Created by XUZY on 2022/1/12.
//

#import <UIKit/UIKit.h>
#import "NSObject+ZYAdd.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ZYAdd)

- (__kindof UIView *)viewWithTagString:(NSString *)tagString;                           /**<    根据TagString获取子视图 */
- (__kindof UIView *)superviewWithTagString:(NSString *)tagString;                      /**<    根据TagString获取父视图 */

- (BOOL)existSubview:(UIView *)view;    /**<    是否存在子视图 */
- (BOOL)existSuperview:(UIView *)view;  /**<    是否存在父视图 */

- (UIImage *)screenshot;                /**<    截图 */

- (UIView*)subViewOfClassName:(NSString*)className;

//******************* Frame *******************
@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat bx;       /**<   右下角的 x */
@property (nonatomic) CGFloat by;       /**<   右下角的 y */

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;

@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

@end

NS_ASSUME_NONNULL_END
