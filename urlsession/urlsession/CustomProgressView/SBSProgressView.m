//
//  SBSProgressView.m
//  urlsession
//
//  Created by Artem Lomov on 01/02/2018.
//  Copyright © 2018 Artem Lomov. All rights reserved.
//

#import "SBSProgressView.h"

@interface SBSProgressView ()

@property (nonatomic, strong) UILabel *progressLabel;
@property (nonatomic, strong) UIView *ballView;

@end


@implementation SBSProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        _progressLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), 40)];
        [self addSubview:_progressLabel];
        
        _ballView = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(frame)-50, 50, 50)];
        _ballView.backgroundColor = [UIColor redColor];
        _ballView.layer.cornerRadius = 25;
        _ballView.layer.masksToBounds = YES;
        [self addSubview:_ballView];
        [self startAnimation];
        
        _progress = 0;
    }
    return self;
}

//BAS IDEA
- (void)startAnimation
{
    [UIView animateWithDuration:0.3 animations:
    ^{
        self.ballView.center = CGPointMake(self.ballView.center.x, self.ballView.center.y - 50*3);
    }completion:^(BOOL finished)
    {
        [UIView animateWithDuration:0.3 animations:^{
            self.ballView.center = CGPointMake(self.ballView.center.x, self.ballView.center.y + 50*3);
        }completion:^(BOOL finished){
            [self startAnimation];
        }];
    }];
}

#pragma mark - Setters

- (void)setProgress:(CGFloat)progress
{
    self.progressLabel.text = [NSString stringWithFormat:@"%f%%", progress];
}

@end
