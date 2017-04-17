//
//  AppDelegate.h
//  UserLogin
//
//  Created by Madhu Mahat on 4/16/17.
//  Copyright © 2017 Madhu Mahat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

