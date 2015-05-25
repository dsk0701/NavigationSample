//
//  UIViewTransitionNavigationController.m
//  NavigationSample
//
//  Created by Daisuke Shiraishi on 2014/02/16.
//  Copyright (c) 2014年 fotome. All rights reserved.
//

#import "UIViewTransitionNavigationController.h"

@implementation UIViewTransitionNavigationController

#define USE_CATRANSITION 1


#ifdef USE_CATRANSITION

#if 0
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self.view.layer removeAllAnimations];

    if (animated) {
        CATransition *transition = [self pushTransition];
        [self.view.layer addAnimation:transition forKey:kCATransition];
    }

    [super pushViewController:viewController animated:NO];
}

- (CATransition *)pushTransition
{
    CATransition *transition = [CATransition animation];
    transition.duration = 0.6f;
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromRight;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];

    return transition;
}
#endif

#else

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (animated) {
        [UIView transitionWithView:self.view duration:0.6f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            [super pushViewController:viewController animated:NO];
        } completion:nil];
    } else {
        [super pushViewController:viewController animated:NO];
    }
}

#endif

@end
