//
//  CounterModel.m
//  uitable
//
//  Created by Artem Lomov on 11/01/2018.
//  Copyright © 2018 Artem Lomov. All rights reserved.
//

#import "CounterModel.h"

@implementation CounterModel

- (instancetype)initWithDataSize:(NSInteger)dataSize
{
    self = [super init];
    if (self)
    {
        _maxCounter = dataSize;
        _counter = @2;
    }
    return self;
}

- (void)setCounter:(NSNumber *)counter
{
    if(counter.integerValue >= 0 && counter.integerValue <= self.maxCounter)
    {
        _counter = counter;
    }
}

@end
