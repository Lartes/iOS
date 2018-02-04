//
//  Person+CoreDataProperties.m
//  CoreData
//
//  Created by max on 19.01.18.
//  Copyright © 2018 Maksim Bakharev. All rights reserved.
//
//

#import "Person+CoreDataProperties.h"

@implementation Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Person"];
}

@dynamic name;
@dynamic surname;

@end
