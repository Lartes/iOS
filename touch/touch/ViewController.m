//
//  ViewController.m
//  touch
//
//  Created by Artem Lomov on 11.12.17.
//  Copyright © 2017 Artem Lomov. All rights reserved.
//

#import "ViewController.h"
#import "SBSTouchView.h"

static const CGFloat leftOffset = 20.f;
static const CGFloat topOffset = 100.f;

@interface ViewController ()

@property (nonatomic, strong) SBSTouchView *touchView;

@property(nonatomic, strong) UITapGestureRecognizer *tapRecognizer;
@property(nonatomic, strong) UISwipeGestureRecognizer *swipeRecognizer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.touchView = [[SBSTouchView alloc] initWithFrame:CGRectMake(leftOffset, topOffset, CGRectGetWidth(self.view.frame) - leftOffset * 2, CGRectGetHeight(self.view.frame) - topOffset * 2)];
    self.touchView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.touchView];

//    [self addGestureRecogniaers];
    
//    [self reloadViewDidLoad];
}

-(void)addGestureRecogniaers
{
    self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureTouchHappened)];
    self.tapRecognizer.delaysTouchesBegan = YES; // дает время рекогнайзеру на обработку евента
    //    self.tapRecognizer.numberOfTouches = 1;
    self.tapRecognizer.numberOfTapsRequired = 1;
    [self.touchView addGestureRecognizer:self.tapRecognizer];
    
    self.swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(gestureSwipeHappened)];
    self.swipeRecognizer.delaysTouchesBegan = YES;
    self.swipeRecognizer.direction = UISwipeGestureRecognizerDirectionDown; // нужно обработывать каждое направление отдельно
    [self.touchView addGestureRecognizer:self.swipeRecognizer];
}

-(void)gestureTouchHappened
{
    NSLog(@"Touch happened");
}

-(void)gestureSwipeHappened
{
    NSLog(@"Swipe happened");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Dumb Method
//- (void)reloadViewDidLoad
//{
//    self.view = nil;
//    self.view.alpha = 1;
//}

@end
