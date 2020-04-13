//
//  AppDelegate.h
//  YogaKitDemo
//
//  Created by liuzhibin on 2020/4/5.
//  Copyright © 2020 liuzhibin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow * window;

@property (readonly, strong) NSPersistentContainer *persistentContainer API_AVAILABLE(ios(10.0));

- (void)saveContext API_AVAILABLE(ios(10.0));


@end

