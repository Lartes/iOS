//
//  ViewController.m
//  animation_timer
//
//  Created by Artem Lomov on 27/01/2018.
//  Copyright © 2018 Artem Lomov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIView *viewToMove;
@property (nonatomic, strong) UIButton *timerButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareUI];
    [self setupTimer];
}

- (void)prepareUI
{
    self.viewToMove = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 70, 70)];
    self.viewToMove.backgroundColor = [UIColor redColor];
    self.viewToMove.layer.cornerRadius = 35;
    [self.view addSubview:self.viewToMove];
    
    self.timerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.timerButton.frame = CGRectMake(0, 0, 40, 70);
    [self.timerButton setTitle:@"Stop" forState:UIControlStateNormal];
    self.timerButton.backgroundColor = [UIColor redColor];
    [self.timerButton addTarget:self action:@selector(stopTimer) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.timerButton];
}

- (void)setupTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerTick) userInfo:nil repeats:YES];
    self.timer.tolerance = 0.05;
}

- (void)timerTick
{
    self.viewToMove.center = CGPointMake(self.viewToMove.center.x + 2, self.viewToMove.center.y + 1);
}

- (void)stopTimer
{
    if (self.timer.isValid)
    {
        [self.timer invalidate];
        self.timer = nil;
    }
}

@end
