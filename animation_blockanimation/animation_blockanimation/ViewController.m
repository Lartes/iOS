//
//  ViewController.m
//  animation_blockanimation
//
//  Created by Artem Lomov on 31/01/2018.
//  Copyright © 2018 Artem Lomov. All rights reserved.
//

#import "ViewController.h"
#import "ProgressView.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *viewToAnimate;
@property (nonatomic, strong) ProgressView *progressBar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareUI];
    //[self startAnimation];
}

- (void)prepareUI
{
    self.viewToAnimate = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.viewToAnimate.backgroundColor = [UIColor redColor];
    self.viewToAnimate.layer.cornerRadius = CGRectGetWidth(self.viewToAnimate.frame)/2.;
    [self.view addSubview:self.viewToAnimate];
    
    self.progressBar = [[ProgressView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame)-50, CGRectGetWidth(self.view.frame), 50)];
    self.progressBar.progressColor = [UIColor blueColor];
    self.progressBar.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.progressBar];
    
    [self.progressBar setProgress:0.8 withAnimation:YES];
}

- (void)startAnimation
{
    [UIView animateWithDuration:2. animations:^{
        self.viewToAnimate.backgroundColor = [UIColor blueColor];
        self.viewToAnimate.frame = CGRectMake(200, 200, 200, 200);
        self.viewToAnimate.layer.cornerRadius = 0.;
    } completion:^(BOOL finished){
        NSLog(@"Animation ended");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
