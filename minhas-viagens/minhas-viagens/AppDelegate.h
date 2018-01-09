//
//  AppDelegate.h
//  minhas-viagens
//
//  Created by Gustavo Bergamim on 20/12/17.
//  Copyright © 2017 Cast Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

