//
//  HXAppViewController.m
//  HXSDK
//
//  Created by jxZang on 13-8-12.
//  Copyright (c) 2013年 jxZang. All rights reserved.
//

#import "HXAppViewController.h"
#import "HXAppManager.h"
#import "HXTools.h"
#import "HXDefaults.h"

@interface HXAppViewController ()
@property (nonatomic, retain) UITableView* tView;
@end

@implementation HXAppViewController

SYNTHESIZE_SINGLETON_FOR_CLASS(HXAppViewController)

- (void)dealloc
{
    self.tView = nil;
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    navBar = [[[UINavigationBar alloc] init] autorelease];
    [self addSubview:navBar];
    [navBar setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    
	self.tView = [[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain] autorelease];
    [self.tView setDelegate:[HXAppManager sharedInstance]];
    [self.tView setDataSource:[HXAppManager sharedInstance]];
    [self.tView setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    [self addSubview:self.tView];
    
    [self reloadFrames];
}

- (void)reloadFrames
{
    [self.tView setFrame:UIEdgeInsetsInsetRect(self.view.bounds, UIEdgeInsetsMake(APP_TABLE_VIEW_TOP, 0, 0, self.width - SLIDE_LEFT_PAD))];
    [navBar setFrame:CGRectMake(0, 0, SLIDE_LEFT_PAD, APP_TABLE_VIEW_TOP)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
