//
//  LPAppDelegate.m
//  LPSimpleExample
//
//  Created by Karl Krukow on 07/10/11.
//  Copyright (c) 2011 Trifork. All rights reserved.
//

#import "LPAppDelegate.h"

#import "LPFirstViewController.h"

#import "LPSecondViewController.h"

#import "LPThirdViewController.h"
#import "LPFourthViewController.h"

@implementation LPAppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    UIViewController *viewController1 = [[[LPFirstViewController alloc] initWithNibName:@"LPFirstViewController" bundle:nil] autorelease];
    UIViewController *viewController2 = [[[LPSecondViewController alloc] initWithNibName:@"LPSecondViewController" bundle:nil] autorelease];
    
    UIViewController *viewController3 = [[[LPThirdViewController alloc] initWithNibName:@"LPThirdViewController" bundle:nil] autorelease];

    UIViewController *viewController4 = [[[LPFourthViewController alloc] initWithNibName:@"LPFourthViewController" bundle:nil] autorelease];

    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
    self.tabBarController.viewControllers = @[viewController1, viewController2,viewController3,viewController4];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];

  //--- your custom code

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
        NSLog(@"RESIGNACTIVE");
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"ENTERBACK");
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
        NSLog(@"ENTERFORE");
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"BECOMEACTIVE");
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
