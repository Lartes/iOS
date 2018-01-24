//
//  MyModel.m
//  parprog
//
//  Created by Artem Lomov on 15/01/2018.
//  Copyright © 2018 Artem Lomov. All rights reserved.
//

#import "MyModel.h"

@implementation MyModel

- (instancetype)init
{
    self = [super init];
    _rcount = 0;
    _rlock = [NSLock new];
    _rcond = [NSCondition new];
    
    return self;
}

- (void) setRcount:(NSInteger)rcount
{
    _rcount = rcount;
}

- (NSInteger) getRcount
{
    dispatch_sync(_queue, ^(void){
        
    })
    return _rcount;
}

@end
