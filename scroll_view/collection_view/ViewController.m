//
//  ViewController.m
//  collection_view
//
//  Created by admin on 18.12.17.
//  Copyright © 2017 admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIScrollView *testScrollView;

@end

@implementation ViewController

- (void)preapareScrollView
{
    UIImage *image = [UIImage imageNamed:@"sky.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = self.view.bounds;
    imageView.contentMode = UIViewContentModeTopLeft;
    
    self.testScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.testScrollView.contentSize = image.size;
    [self.testScrollView addSubview:imageView];
    [self.view addSubview:self.testScrollView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self preapareScrollView];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
