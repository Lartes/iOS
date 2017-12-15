//
//  PresenterOutputProtocol.h
//  buttons
//
//  Created by admin on 15.12.17.
//  Copyright © 2017 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PresenterInputProtocol <NSObject>

@required
- (void)decrementTapped;
- (void)incrementTapped;

@end

@protocol PresenterOutputProtocol <NSObject>

@required
- (void)counterDidChanged;

@end
