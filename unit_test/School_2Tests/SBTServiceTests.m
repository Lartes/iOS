//
//  SBTServiceTests.m
//  School_2Tests
//
//  Created by admin on 08.12.17.
//  Copyright © 2017 none. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SBTService.h"
#import <OCMock/OCMock.h>
#import <Expecta/Expecta.h>
#import "SBTPersonProvider.h"

@interface SBTService(Tests)
- (NSArray *)fakeData;
@end

@interface SBTServiceTests : XCTestCase

@property (nonatomic, strong) SBTService *service;

@end

@implementation SBTServiceTests

- (void)setUp
{
    [super setUp];
    self.service = OCMPartialMock([SBTService new]);
}

- (void)tearDown
{
    self.service = nil;
    [super tearDown];
}

- (void)testGetPersonListFromNilProvider
{
    NSArray *personList = [self.service getPersonListFromProvider:nil];
    expect(personList).to.beNil();
}

- (void)testGetPersonListFromDataProvider
{
    id provider = OCMClassMock([SBTPersonProvider class]);
    OCMStub([self.service fakeData]).andReturn(nil);
    
    NSArray *personList = [self.service getPersonListFromProvider:provider];
    
    expect(personList).to.beNil();
}

- (void)testGetPersonListFromProvider
{
    id provider = OCMClassMock([SBTPersonProvider class]);
    
    OCMStub([provider getPersonListFromJSON:@[]]).andReturn(@[@"Steve Jobs"]);
    
    OCMStub([self.service fakeData]).andReturn(@[]);
    
    NSArray *personList = [self.service getPersonListFromProvider:provider];
    
    expect(personList).toNot.beNil();
    expect(personList.count > 0).to.equal(YES);
    expect(personList.firstObject).to.equal(@"Steve Jobs");
}

@end

//- (NSArray *)getPersonListFromProvider:(SBTPersonProvider *)provider
//{
//    if (!provider)
//    {
//       return nil;
//    }
//
//    NSArray *data = [self fakeData];
//    if (!data)
//    {
//        return nil;
//    }
//
//    return [provider getPersonListFromJSON:data];
//}
