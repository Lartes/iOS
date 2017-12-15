//
//  ViewController.m
//  buttons
//
//  Created by admin on 15.12.17.
//  Copyright © 2017 admin. All rights reserved.
//

#import "ViewController.h"
#import "CounterModel.h"
#import "Presenter.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *counterLabel;
@property (nonatomic, strong) UIButton *decrementButton;
@property (nonatomic, strong) UIButton *incrementButton;

@property (nonatomic, strong) Presenter *presenter;

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
    [self.view addSubview:self.decrementButton];
    
    self.incrementButton = [[UIButton alloc] initWithFrame:CGRectMake(150, 100, 100, 25)];
    [self.incrementButton setTitle:@"increment" forState:UIControlStateNormal];
    self.incrementButton.backgroundColor = UIColor.lightGrayColor;
    [self.incrementButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.view addSubview:self.incrementButton];
    
    self.presenter = [[Presenter alloc] initWithView:self];
    [self.decrementButton addTarget:self.presenter action:@selector(decrementTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.incrementButton addTarget:self.presenter action:@selector(incrementTapped) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setCounterText:(NSString *)counterText
{
    self.counterLabel.text = counterText;
}


- (void)setDecrementButtonEnabled:(BOOL)enabled
{
    self.decrementButton.enabled = enabled;
}


@end
