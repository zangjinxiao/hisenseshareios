//
//  AppDelegate.m
//  HXSDK
//
//  Created by jxZang on 13-8-10.
//  Copyright (c) 2013年 jxZang. All rights reserved.
//

#import "HXAppDelegate.h"
#import "HXSlideButton.h"
#import <QuartzCore/QuartzCore.h>
#import "HXNavigationController.h"
#import "HXAppViewController.h"
#import "HXDefaults.h"
#import "HXScaleWindow.h"

@interface HXAppDelegate ()

@property (retain, nonatomic) UIWindow *bottomWindow;
@property (retain, nonatomic) UINavigationController* nav;

@end

@implementation HXAppDelegate

- (void)dealloc
{
    self.window = nil;
    self.bottomWindow = nil;
    self.nav = nil;
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [application setStatusBarStyle:UIStatusBarStyleDefault];

    [self setupBottomWindow];
    [self setupNavigationController];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    [self.window setWindowLevel:1];
    [self.window makeKeyAndVisible];

    [self.window setRootViewController:self.nav];
    
    return YES;
}

- (void)setupBottomWindow
{
    self.bottomWindow = [[[HXScaleWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    [self.bottomWindow setRootViewController:[HXAppViewController sharedInstance]];
    [self.bottomWindow setWindowLevel:0];
    [self.bottomWindow makeKeyAndVisible];
}

- (void)setupNavigationController
{
    HXNavigationController* navTemp = [[[HXNavigationController alloc] init] autorelease];
    [navTemp.slideButton setActView:self.window];
    [navTemp.slideButton setBaseView:self.bottomWindow];
    [navTemp.slideButton setLpad:SLIDE_LEFT_PAD];
    self.nav = navTemp;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    HXNavigationController* tNav = (HXNavigationController*)self.nav;
    [tNav.slideButton leftMove];
    return YES;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self.nav pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    return [self.nav popViewControllerAnimated:animated];
}

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated
{
    return [self.nav popToRootViewControllerAnimated:animated];
}

- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    return [self.nav popToViewController:viewController animated:animated];
}

@end
