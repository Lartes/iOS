//
//  CounterModel.h
//  uitable
//
//  Created by Artem Lomov on 11/01/2018.
//  Copyright © 2018 Artem Lomov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CounterModel : NSObject

@property (nonatomic, strong) NSNumber *counter;
@property (nonatomic) NSInteger maxCounter;

- (instancetype)initWithDataSize:(NSInteger)dataSize;

@end
