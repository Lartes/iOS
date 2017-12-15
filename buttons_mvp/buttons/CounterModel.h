//
//  CounterModel.h
//  buttons
//
//  Created by admin on 15.12.17.
//  Copyright © 2017 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PresenterOutputProtocol;

@interface CounterModel : NSObject

@property (nonatomic, weak) id<PresenterOutputProtocol> presenter;
@property (nonatomic, readonly) NSNumber *counter;

- (void)decrement;
- (void)increment;

@end
