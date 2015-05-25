//
//  ViewController.m
//  NavigationSample
//
//  Created by Shiraishi Daisuke on 2014/02/05.
//  Copyright (c) 2014年 fotome. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) UIDynamicAnimator *animator;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {

    // アニメーションさせるビュー（赤い四角）
    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(110.0, 0.0, 100.0, 100.0)];
    myView.backgroundColor = [UIColor redColor];
    [self.view addSubview:myView];

    // UIDynamicAnimator！今回の主役
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];

    // UIDynamicAnimatorの仲間たち１。重力を司る者
    UIGravityBehavior *gravityBeahvior = [[UIGravityBehavior alloc] initWithItems:@[myView]];

    // UIDynamicAnimatorの仲間たち２。衝突を司る者
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[myView]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;

    // アニメーターにビヘイビアを登録
    [self.animator addBehavior:gravityBeahvior];
    [self.animator addBehavior:collisionBehavior];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
