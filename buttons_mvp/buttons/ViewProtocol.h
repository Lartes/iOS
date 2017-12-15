//
//  ViewProtocol.h
//  buttons
//
//  Created by admin on 15.12.17.
//  Copyright © 2017 admin. All rights reserved.
//

@protocol ViewProtocol <NSObject>

@required
- (void)setCounterText:(NSString *)counterText;
- (void)setDecrementButtonEnabled:(BOOL)enabled;

@end
