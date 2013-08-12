//
//  HXNavigationController.m
//  HXSDK
//
//  Created by jxZang on 13-8-11.
//  Copyright (c) 2013年 jxZang. All rights reserved.
//

#import "HXNavigationController.h"
#import "HXSlideButton.h"

@implementation HXNavigationController

- (id)init
{
    if (self = [super init])
    {
        self.slideButton = [[[HXSlideButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)] autorelease];
    }
    return self;
}

- (void)dealloc
{
    self.slideButton = nil;
    [super dealloc];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count == 0)
    {
        UIBarButtonItem* leftBarButtonItem = [[[UIBarButtonItem alloc] init] autorelease];
        [leftBarButtonItem setCustomView:self.slideButton];
        viewController.navigationItem.leftBarButtonItem = leftBarButtonItem;
    }
    [super pushViewController:viewController animated:animated];
}

@end
