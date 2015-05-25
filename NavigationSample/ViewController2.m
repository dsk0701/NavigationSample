//
//  ViewController2.m
//  NavigationSample
//
//  Created by Shiraishi Daisuke on 2014/02/24.
//  Copyright (c) 2014年 fotome. All rights reserved.
//

#import "ViewController2.h"
#import "AnimationController.h"

@interface ViewController2 () {
    AnimationController *_animationController;
}
@end

@implementation ViewController2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    self.navigationController.delegate = self;
    // アニメーションを管理するクラス
    _animationController =[[AnimationController alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return _animationController;
}

#pragma mark - UINavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    // 画面遷移の状態によってアニメーションの向きを変える
    _animationController.isReverse = operation == UINavigationControllerOperationPop;
    
    return _animationController;
}

@end
