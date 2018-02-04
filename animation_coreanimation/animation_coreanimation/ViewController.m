//
//  ViewController.m
//  animation_coreanimation
//
//  Created by Artem Lomov on 30/01/2018.
//  Copyright © 2018 Artem Lomov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <CAAnimationDelegate>
@property (nonatomic, strong) UIView *viewToAnimate;
@property (nonatomic, strong) CAKeyframeAnimation *keyframeAnimation;
@property (nonatomic, strong) CABasicAnimation *basicAnimation;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareUI];
    [self setupBasicAnimation];
    [self setupKeyframeAnimation];
    [self setupAndRunGroupAnimation];
}

- (void)prepareUI
{
    self.viewToAnimate = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.viewToAnimate.backgroundColor = [UIColor redColor];
    self.viewToAnimate.center = self.view.center;
    [self.view addSubview:self.viewToAnimate];
}

- (void)setupBasicAnimation
{
    self.basicAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    self.basicAnimation.repeatCount = 1;
    self.basicAnimation.duration = 2;
    self.basicAnimation.autoreverses = YES;
    self.basicAnimation.fromValue = @(1);
    self.basicAnimation.toValue = @(0);
    //[self.viewToAnimate.layer addAnimation:self.basicAnimation forKey:@"basicanimkey"];
}

- (void)setupKeyframeAnimation
{
    self.keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    self.keyframeAnimation.repeatCount = 2;
    self.keyframeAnimation.duration = 2.5;
    self.keyframeAnimation.autoreverses = YES;
    self.keyframeAnimation.values = @[@(CGPointMake(100, 100)), @(CGPointMake(100, 200)), @(CGPointMake(200, 200)), @(CGPointMake(200, 100))];
    self.keyframeAnimation.delegate = self;
    //[self.viewToAnimate.layer addAnimation:self.keyframeAnimation forKey:@"keyanimkey"];
}

- (void)setupAndRunGroupAnimation
{
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[self.basicAnimation, self.keyframeAnimation];
    group.timeOffset = 2;
    group.repeatCount = 2;
    group.duration = 2.0;
    group.removedOnCompletion = NO;
    [self.viewToAnimate.layer addAnimation:group forKey:@"groupanim"];
}

#pragma mark - CAAnimationDelegate

- (void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"Animation %@ started", anim.description);
}


@end
