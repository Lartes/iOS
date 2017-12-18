//
//  SBTPersonProvider.m
//  School_2Tests
//
//  Created by admin on 12.12.17.
//  Copyright © 2017 none. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <Expecta/Expecta.h>
#import "SBTPerson.h"
#import "SBTPersonProvider.h"

@interface MySBTPerson : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *secondName;
@property (nonatomic, copy) NSString *lastName;

@end

@implementation MySBTPerson

@end

@interface SBTPersonProviderTests : XCTestCase

@property (nonatomic, strong) SBTPersonProvider *provider;

@end

@implementation SBTPersonProviderTests

- (void)setUp {
    [super setUp];
    self.provider = OCMPartialMock([SBTPersonProvider new]);
}

- (void)tearDown {
    self.provider = nil;
    [super tearDown];
}

- (void)testGetPersonListFromJSONNilData
{
    NSArray *personList = [self.provider getPersonListFromJSON:nil];
    expect(personList).to.beNil();
}

- (void)testGetPersonListFromJSONEmptyData
{
    NSArray *personList = [self.provider getPersonListFromJSON:@[]];
    expect(personList).toNot.beNil();
    expect(personList.count > 0).to.equal(NO);
}

- (void)testGetPersonListFromJSON
{
    id person = OCMClassMock([SBTPerson class]);
    MySBTPerson *myPerson = [MySBTPerson new];
    OCMStub([person new]).andReturn(myPerson);
    
    NSDictionary *dict = @{
                            @"firstName" : @"Artem",
                            @"lastName" : @"Lomov",
                            @"secondName" : @"Sergeevich"
                            };
    NSArray *arr = @[dict];
    NSArray *personList = [self.provider getPersonListFromJSON:arr];
    expect(((MySBTPerson*)personList[0]).firstName).to.equal(@"Artem");
    expect(((MySBTPerson*)personList[0]).lastName).to.equal(@"Lomov");
    expect(((MySBTPerson*)personList[0]).secondName).to.equal(@"Sergeevich");
}


@end
