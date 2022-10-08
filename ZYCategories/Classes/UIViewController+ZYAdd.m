//
//  UIViewController+ZYAdd.m
//  ZYCategories
//
//  Created by XUZY on 2022/1/12.
//

#import "UIViewController+ZYAdd.h"

@implementation UIViewController (ZYAdd)
#pragma mark - topVC
+ (UIViewController *)currentViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

+ (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}

- (BOOL)popToViewControllerClass:(Class)viewControllerClass animated:(BOOL)animated {
    if (self.navigationController.viewControllers.count > 0) {
        NSArray * vcs = [self.navigationController childViewControllers];
        for (NSInteger i = vcs.count - 1; i>=0; i--) {
            if ([vcs[i] isKindOfClass:viewControllerClass]) {
                [self.navigationController popToViewController:vcs[i] animated:animated];
                return YES;
            }
        }
    }
    return NO;
}

- (BOOL)dismissToRootViewControllerAnimated:(BOOL)animated completion: (void (^ __nullable)(void))completion {
    UIViewController *controller = self;
    while(controller.presentingViewController){
        controller = controller.presentingViewController;
    }
    if (controller == self) {
        return NO;
    }
    [controller dismissViewControllerAnimated:animated completion:completion];
    return YES;
}

- (BOOL)dismissToViewControllerClass:(Class)viewControllerClass animated:(BOOL)animated completion: (void (^ __nullable)(void))completion {
    UIViewController *controller = self;
    while(controller.presentingViewController){
        controller = controller.presentingViewController;
        if ([controller isKindOfClass:viewControllerClass]) {
            break;
        }
    }
    if (controller != self && [controller isKindOfClass:viewControllerClass]) {
        [controller dismissViewControllerAnimated:animated completion:completion];
        return YES;
    }
    return NO;
}
@end
