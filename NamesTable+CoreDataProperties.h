//
//  NamesTable+CoreDataProperties.h
//  FinalCoreData
//
//  Created by Madhu Mahat on 4/13/17.
//  Copyright © 2017 Madhu Mahat. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "NamesTable+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface NamesTable (CoreDataProperties)

+ (NSFetchRequest<NamesTable *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *firstName;
@property (nullable, nonatomic, copy) NSString *lastName;

@end

NS_ASSUME_NONNULL_END
