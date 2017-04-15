//
//  NamesTable+CoreDataProperties.m
//  FinalCoreData
//
//  Created by Madhu Mahat on 4/13/17.
//  Copyright © 2017 Madhu Mahat. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "NamesTable+CoreDataProperties.h"

@implementation NamesTable (CoreDataProperties)

+ (NSFetchRequest<NamesTable *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"NamesTable"];
}

@dynamic firstName;
@dynamic lastName;

@end
