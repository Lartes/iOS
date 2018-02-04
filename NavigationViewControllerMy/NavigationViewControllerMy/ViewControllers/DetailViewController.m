//
//  DetailViewController.m
//  NavigationViewControllerMy
//
//  Created by Artem Lomov on 03/02/2018.
//  Copyright © 2018 Artem Lomov. All rights reserved.
//

#import "DetailViewController.h"
#import "SBFilmView.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareUI];
}

- (void)prepareUI
{
    self.view.backgroundColor = [UIColor greenColor];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addSomething)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    self.navigationController.navigationBar.barTintColor = [UIColor yellowColor];
    
    SBFilmView *filmView = [[SBFilmView alloc]initWithFilm:self.filmToShow andFrame:CGRectMake(20, CGRectGetMaxY(self.navigationController.navigationBar.frame) + 10, CGRectGetWidth(self.view.frame) - 20*2, CGRectGetHeight(self.view.frame) - CGRectGetMaxY(self.navigationController.navigationBar.frame) - 10*2)];
    [self.view addSubview:filmView];
}

- (void)addSomething
{
    
}

@end
