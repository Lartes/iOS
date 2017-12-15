//
//  ViewController.m
//  buttons
//
//  Created by admin on 15.12.17.
//  Copyright © 2017 admin. All rights reserved.
//

#import "ViewController.h"
#import "CounterModel.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *counterLabel;
@property (nonatomic, strong) UIButton *decrementButton;
@property (nonatomic, strong) UIButton *incrementButton;

@property (nonatomic, strong) CounterModel *model;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.counterLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 40, 100, 25)];
    self.counterLabel.textColor = UIColor.blackColor;
    self.counterLabel.textAlignment = NSTextAlignmentCenter;
    self.counterLabel.backgroundColor = UIColor.lightGrayColor;
    [self.view addSubview:self.counterLabel];
    
    self.decrementButton = [[UIButton alloc] initWithFrame:CGRectMake(25, 100, 100, 25)];
    [self.decrementButton setTitle:@"decrement" forState:UIControlStateNormal];
    self.decrementButton.backgroundColor = UIColor.lightGrayColor;
    [self.decrementButton setTitleColor:UIColor.grayColor forState:UIControlStateDisabled];
    [self.decrementButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.decrementButton addTarget:self action:@selector(decrementTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.decrementButton];
    
    self.incrementButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 100, 100, 25)];
    [self.incrementButton setTitle:@"increment" forState:UIControlStateNormal];
    self.incrementButton.backgroundColor = UIColor.lightGrayColor;
    [self.incrementButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.incrementButton addTarget:self action:@selector(incrementTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.incrementButton];
    
    self.model = [CounterModel new];
    [self updateView];
}

- (void)decrementTapped:(id)sender
{
    [self.model setCounter:@(self.model.counter.integerValue - 1)];
    [self updateView];
}

- (void)incrementTapped:(id)sender
{
    [self.model setCounter:@(self.model.counter.integerValue + 1)];
    [self updateView];
}

- (void)updateView
{
    self.decrementButton.enabled = self.model.counter.integerValue > 0;
    
    NSNumberFormatter *formatter = [NSNumberFormatter new];//можно задавать сложные правила отображения
    formatter.numberStyle = NSNumberFormatterSpellOutStyle;
    self.counterLabel.text = [formatter stringFromNumber:self.model.counter];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
