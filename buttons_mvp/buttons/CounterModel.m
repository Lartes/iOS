//
//  CounterModel.m
//  buttons
//
//  Created by admin on 15.12.17.
//  Copyright © 2017 admin. All rights reserved.
//

#import "CounterModel.h"
#import "PresenterProtocol.h" //именно тут из со скорости компиляции

@interface CounterModel ()

@property (nonatomic, strong) NSNumber *counter;

@end

@implementation CounterModel

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _counter = @0;
    }
    return self;
}

- (void)decrement
{
    if(self.counter.integerValue >= 0)
    {
        self.counter = @(self.counter.integerValue - 1);
        [self.presenter counterDidChanged];
    }
}

- (void)increment
{
    self.counter = @(self.counter.integerValue + 1);
    [self.presenter counterDidChanged];
}

@end
