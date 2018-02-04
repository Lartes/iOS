//
//  ViewController.m
//  NavigationViewControllerMy
//
//  Created by Artem Lomov on 03/02/2018.
//  Copyright © 2018 Artem Lomov. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "SBFilm.h"

@interface ViewController ()

@property (nonatomic, strong) SBFilm *filmModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fillModel];
    [self prepareUI];
}

- (void)fillModel
{
    self.filmModel = [SBFilm new];
    self.filmModel.filmTitle = @"StarWars";
    self.filmModel.filmImage = [UIImage imageNamed:@"coffee"];
}

- (void)prepareUI
{
    self.view.backgroundColor = [UIColor redColor];
    
    self.navigationItem.title = @"Root VC";
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame)-60, CGRectGetWidth(self.view.frame), 60)];
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"Next" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pushNextVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)pushNextVC
{
    DetailViewController *detailViewController = [DetailViewController new];
    detailViewController.filmToShow = self.filmModel;
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
