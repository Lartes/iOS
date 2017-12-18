//
//  SBSTouchView.m
//  touch
//
//  Created by Artem Lomov on 11.12.17.
//  Copyright © 2017 Artem Lomov. All rights reserved.
//

#import "SBSTouchView.h"

static const NSInteger viewSize = 25;

@interface SBSTouchView ()

@property (nonatomic, strong) UIView *viewToMove;

@end

@implementation SBSTouchView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        _viewToMove = [[UIView alloc] initWithFrame:CGRectMake(10, 10, viewSize, viewSize)];
        _viewToMove.backgroundColor = [UIColor blueColor];
        [self addSubview:_viewToMove];
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint touchCoord = [self pointForTouch:touches];
    NSLog(@"касание началось c координатами x = %f, y = %f", touchCoord.x, touchCoord.y);
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint touchCoord = [self pointForTouch:touches];
    self.viewToMove.center = [self canMove:touchCoord];
    NSLog(@"касание идет c координатами x = %f, y = %f", touchCoord.x, touchCoord.y);
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint touchCoord = [self pointForTouch:touches];
    NSLog(@"касание закончилось c координатами x = %f, y = %f", touchCoord.x, touchCoord.y);
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"касание отменено");
}

-(CGPoint)pointForTouch:(NSSet <UITouch *> *) touches
{
    UITouch *touch = touches.allObjects.firstObject;
    return [touch locationInView:self];
}

#pragma mark - addings

-(CGPoint)canMove:(CGPoint) touchCoord
{
    return CGPointMake(MIN(MAX(touchCoord.x, viewSize/2), CGRectGetWidth(self.frame) - viewSize/2),
                       MIN(MAX(touchCoord.y, viewSize/2), CGRectGetHeight(self.frame) - viewSize/2));
}

@end
