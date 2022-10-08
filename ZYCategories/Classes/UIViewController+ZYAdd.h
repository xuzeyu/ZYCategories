//
//  UIViewController+ZYAdd.h
//  ZYCategories
//
//  Created by XUZY on 2022/1/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (ZYAdd)
+ (UIViewController *)currentViewController;
- (BOOL)popToViewControllerClass:(Class)viewControllerClass animated:(BOOL)animated;
- (BOOL)dismissToRootViewControllerAnimated:(BOOL)animated completion: (void (^ __nullable)(void))completion;
- (BOOL)dismissToViewControllerClass:(Class)viewControllerClass animated:(BOOL)animated completion: (void (^ __nullable)(void))completion;
@end

NS_ASSUME_NONNULL_END
