//
//  HXShiPinViewController.m
//  HXSDK
//
//  Created by jxZang on 13-8-12.
//  Copyright (c) 2013年 jxZang. All rights reserved.
//

#import "HXShiPinViewController.h"
#import "HXTools.h"

@interface HXShiPinViewController ()

@end

@implementation HXShiPinViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
    [label setText:NSStringFromClass(self.class)];
    [self addSubview:label];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
