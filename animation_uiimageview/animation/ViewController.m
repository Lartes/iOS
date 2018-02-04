//
//  ViewController.m
//  animation
//
//  Created by Artem Lomov on 26/01/2018.
//  Copyright © 2018 Artem Lomov. All rights reserved.
//

#import "ViewController.h"

const CGFloat imageViewSize = 200;
const NSInteger imageCount = 11;
const CGFloat buttonHeight = 60;

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *animationButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self prepareUI];
}

- (void)prepareUI
{
    [self setupImageView];
    [self setupButton];
}

- (void) setupButton
{
    self.animationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.animationButton.frame = CGRectMake(0, CGRectGetHeight(self.view.frame) - buttonHeight, CGRectGetWidth(self.view.frame), buttonHeight);
    [self.animationButton setTitle:@"Start animation" forState:UIControlStateNormal];
    [self.animationButton addTarget:self action:@selector(changeAnimationState) forControlEvents:UIControlEventTouchUpInside];
    [self.animationButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:self.animationButton];
}

- (void) setupImageView
{
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - imageViewSize/2, self.view.frame.size.height/2 - imageViewSize/2, imageViewSize, imageViewSize)];
    
    self.imageView.image = [UIImage imageNamed:@"0"];
    NSMutableArray *mutableArrayForImages = [NSMutableArray new];
    for (int i = 0; i<imageCount; i++)
    {
        NSString *imageName = [NSString stringWithFormat:@"%d", i];
        UIImage *image = [UIImage imageNamed:imageName];
        [mutableArrayForImages addObject:image];
    }
    
    self.imageView.animationImages = mutableArrayForImages;
    self.imageView.animationDuration = 2.5;
    self.imageView.animationRepeatCount = 0; //infinite
    [self.view addSubview:self.imageView];
}

- (void)changeAnimationState
{
    if (self.imageView.isAnimating)
    {
        [self.imageView stopAnimating];
        [self.animationButton setTitle:@"Start animation" forState:UIControlStateNormal];
    }
    else
    {
        [self.imageView startAnimating];
        [self.animationButton setTitle:@"Stop animation" forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
