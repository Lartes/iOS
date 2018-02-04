//
//  main.m
//  patterns
//
//  Created by Artem Lomov on 24/01/2018.
//  Copyright © 2018 Artem Lomov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@protocol Foo
- (void)foo;
@end

//********************************
//Singleton
//********************************
@interface MySingleton: NSObject <Foo>

+ (instancetype)shared;
- (void)foo;

@end

@implementation MySingleton

static MySingleton *shared = nil;

+ (instancetype)shared
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(!shared)
        {
            shared = [[MySingleton alloc] init];
        }
    });
    return shared;
}

- (void)foo
{
    NSLog(@"Foo!");
}

@end
//********************************

//как мзбавиться ио синглтона. ЕГо раньше использовал Bar
@interface Bar:NSObject
- (instancetype)initWithDependency:(id<Foo>) dependency;
- (void)bar;
@end

@interface Bar ()
@property (nonatomic, strong) id<Foo> foo;
@end

@implementation Bar

- (instancetype)initWithDependency:(id<Foo>) dependency;
{
    self = [super init];
    if(self)
    {
        _foo = dependency;
    }
    return self;
}

- (void)bar
{
    [self.foo foo];
}
@end





//********************************
//Fabric method
//********************************
@class Person;

@interface PersonService:NSObject
+ (instancetype)networkService;
+ (instancetype)coreDataService;
@end

@interface PersonNetworkService:PersonService
@end

@implementation PersonNetworkService
- (Person*)getPerson
{
    return nil; //[Person new];
}
@end

@interface PersonCoreDataService:PersonService
@end

@implementation PersonCoreDataService
- (Person*)getPerson
{
    return nil; //[Person new];
}
@end

@implementation PersonService
+ (instancetype)networkService
{
    return [PersonNetworkService new];
}
+ (instancetype)coreDataService
{
    return [PersonCoreDataService new];
}

- (Person *)getPerson {
    return nil; //exception should be here
}

@end


int main(int argc, char * argv[]) {
    @autoreleasepool {
        PersonService *networkService = [PersonService networkService];
        PersonService *coreDataService = [PersonService coreDataService];
    }
    return 0;
}
//********************************





//********************************
//
//********************************
@interface Person1:NSObject <NSCopying>
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, assign) NSUInteger age;
@end

@implementation Person1
- (void)printPerson
{
    NSLog(@"%@ %@ %@ %@", self, self.firstName, self.lastName, @(self.age));
}

- (instancetype)copyWithZone:(NSZone *)zone
{
    Person1 *newPerson = [[self class] allocWithZone:zone];
    newPerson.firstName = self.firstName;
    newPerson.lastName = self.lastName;
    newPerson.age = self.age;
    return newPerson;
}
@end

int main(int argc, char * argv[]) {
    @autoreleasepool {
        Person1 *person = [Person1 new];
        person.firstName = @"John";
        person.lastName = @"Dow";
        person.age = 99;
        [person printPerson];
        Person1 *newPerson = [person copy];
        [newPerson printPerson];
    }
    return 0;
}
//********************************




//********************************
//Iterator
//********************************
@interface Node:NSObject
@property (nonatomic, copy) NSString data; //@property (nonatomic, strong) id data;
@property (nonatomic, strong) Node *next;
@end

@implementation Node
@end

@interface LinkedList:NSObject
@property (nonatomic, strong) Node *head;

- (instancetype)initWithNode:(Node *)head NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

@end

@implementation LinkedList
- (instancetype)initWithNode:(Node *)head
{
    self = [super init];
    if (self)
    {
        _head = head;
    }
    return self;
}
@end

@protocol Enumerable
- (BOOL)isDone;
- (id)next;
- (id)current;
@end

@interface LinkedListIterator:NSObject <Enumerable>
- (instancetype)initWithLinkedList:(LinkedList *) list;
- (Node *)next;
- (Node *)current;
@end

@interface LinkedListIterator ()
@property (nonatomic, strong) Node *current;
@end

@implementation LinkedListIterator
- (instancetype)initWithLinkedList:(LinkedList *)list
{
    self = [super init];
    if (self)
    {
        _current = list.head;
    }
    return self;
}

- (BOOL)isDone
{
    return !self.current;
}

- (Node *)next
{
    self.current = self.current.next;
    return self.current;
}
- (Node *)current
{
    return self.current;
}
@end


@interface ArrayIterator:NSObject <Enumerable>
- (instancetype)initWithArray:(NSArray *) array;
@end

@interface ArrayIterator ()
@property (nonatomic, assign) NSUInteger index;
@property (nonatomic, copy) NSArray *array;
@end

@implementation ArrayIterator
- (instancetype)initWithArray:(NSArray *) array
{
    self = [super init];
    if (self)
    {
        _index = 0;
        _array = array;
    }
    return self;
}

- (BOOL)isDone
{
    return self.index >= self.array.count;
}

- (Node *)next
{
    return ;
}
- (Node *)current
{
    return ;
}
@end


int main(int argc, char * argv[]) {
    @autoreleasepool {
        Node *node0 = [Node new];
        node0.data = @"Node 0";
        Node *node1 = [Node new];
        node1.data = @"Node 1";
        Node *node2 = [Node new];
        node2.data = @"Node 2";
        LinkedList *list = [[LinkedList alloc] initWithNode:node0];
        node0.next = node1;
        node1.next = node2;
        LinkedListIterator *iterator = [[LinkedListIterator alloc] initWithLinkedList:list];
        while (![iterator isDone])
        {
            NSLog(@"%@", [iterator current].data);
            [iterator next];
        }
    }
    return 0;
}









