//
//  ViewController.m
//  PresentViewController
//
//  Created by Artem Lomov on 03/02/2018.
//  Copyright © 2018 Artem Lomov. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self prepareUI];
}

- (void)prepareUI
{
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton *nextVCButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextVCButton.frame = CGRectMake(0, CGRectGetHeight(self.view.frame) - 60, CGRectGetWidth(self.view.frame), 60);
    [nextVCButton setTitle:@"Forward" forState:UIControlStateNormal];
    nextVCButton.backgroundColor = [UIColor grayColor];
    [nextVCButton addTarget:self action:@selector(presentVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextVCButton];
}


- (void)presentVC
{
    UIViewController *detailViewController = [[DetailViewController alloc] init];
    [self presentViewController:detailViewController animated:YES completion:^{
        NSLog(@"New controller start");
    }];
}

@end
