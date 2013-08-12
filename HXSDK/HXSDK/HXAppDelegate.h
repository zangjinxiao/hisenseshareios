//
//  AppDelegate.h
//  HXSDK
//
//  Created by jxZang on 13-8-10.
//  Copyright (c) 2013年 jxZang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXAppDelegate : UIResponder <UIApplicationDelegate>

@property (retain, nonatomic) UIWindow *window;

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (UIViewController *)popViewControllerAnimated:(BOOL)animated;
- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated;

@end
