//
//  MyModel.h
//  parprog
//
//  Created by Artem Lomov on 15/01/2018.
//  Copyright © 2018 Artem Lomov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyModel : NSObject

@property (nonatomic) NSInteger rcount;
@property (nonatomic, strong) NSLock *rlock;
@property (nonatomic, strong) NSCondition *rcond;
@property (nonatomic, strong) dispatch_queue_t queue;

- (void) setRcount:(NSInteger)rcount;
- (NSInteger) getRcount;

@end
