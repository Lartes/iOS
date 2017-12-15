//
//  Presenter.h
//  buttons
//
//  Created by admin on 15.12.17.
//  Copyright © 2017 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PresenterProtocol.h"

@protocol ViewProtocol;

@interface Presenter : NSObject <PresenterInputProtocol, PresenterOutputProtocol>

- (instancetype)initWithView:(id<ViewProtocol>)view;

@end
