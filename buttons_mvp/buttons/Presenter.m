//
//  Presenter.m
//  buttons
//
//  Created by admin on 15.12.17.
//  Copyright © 2017 admin. All rights reserved.
//

#import "Presenter.h"
#import "CounterModel.h"
#import "ViewProtocol.h"

@interface Presenter()

@property (nonatomic, weak) id<ViewProtocol> view; // view реализует данный протокол
@property (nonatomic, strong) CounterModel *model;

@end


@implementation Presenter

- (instancetype)initWithView:(id<ViewProtocol>)view
{
    self = [super init];
    if(self)
    {
        _view = view;
        _model = [CounterModel new];
        _model.presenter = self;
        [self counterDidChanged];
    }
    return self;
}

- (void)decrementTapped
{
    [self.model decrement];
}

- (void)incrementTapped
{
    [self.model increment];
}

- (void)counterDidChanged
{
    [self.view setDecrementButtonEnabled:self.model.counter.integerValue > 0];
    
    NSNumberFormatter *formatter = [NSNumberFormatter new];//можно задавать сложные правила отображения
    formatter.numberStyle = NSNumberFormatterSpellOutStyle;
    [self.view setCounterText:[formatter stringFromNumber:self.model.counter]];
}

@end
