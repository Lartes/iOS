//
//  ProgressView.m
//  animation_blockanimation
//
//  Created by Artem Lomov on 31/01/2018.
//  Copyright © 2018 Artem Lomov. All rights reserved.
//

#import "ProgressView.h"

@interface ProgressView ()
@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, strong) UIView *progressView;
@end

@implementation ProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        _progressView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, CGRectGetHeight(frame))];
        _progressView.backgroundColor = [UIColor greenColor];
        [self addSubview:_progressView];
        
        _progress = 0;
    }
    return self;
}

- (void)setProgress:(CGFloat)progress withAnimation:(BOOL)animated
{
    CGFloat newWidth = progress * CGRectGetWidth(self.frame);
    if (animated)
    {
        [UIView animateWithDuration:1.0 animations:^{
            self.progressView.frame = CGRectMake(0, 0, newWidth, CGRectGetHeight(self.frame));
        }];
    }
    else
    {
        self.progressView.frame = CGRectMake(0, 0, newWidth, CGRectGetHeight(self.frame));
    }
}

-(void)setProgressColor:(UIColor *)progressColor
{
    _progressColor = progressColor;
    self.progressView.backgroundColor = progressColor;
}

@end
