//
//  Person+CoreDataProperties.h
//  CoreData
//
//  Created by max on 19.01.18.
//  Copyright © 2018 Maksim Bakharev. All rights reserved.
//
//

#import "Person+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *surname;

@end

NS_ASSUME_NONNULL_END
