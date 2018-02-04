//
//  NetworkServiceProtocol.h
//  urlsession
//
//  Created by Artem Lomov on 03/02/2018.
//  Copyright © 2018 Artem Lomov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetworkServiceOutputProtocol <NSObject>
@optional

- (void)loadingContinuesWithProgress:(double)progress;
- (void)loadingIsDoneWithDataRecieved:(NSData *)dataRecieved;

@end

@protocol NetworkServiceInputProtocol <NSObject>
@optional

- (void)configureUrlSessionParams:(NSDictionary *)params;
- (void)startImageLoading;
- (void)suspendNetworkLoading;
- (BOOL)resumeNetworkLoading;

@end
