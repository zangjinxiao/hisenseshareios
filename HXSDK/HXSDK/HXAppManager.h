//
//  HXAppManager.h
//  LRSlideView
//
//  Created by jxZang on 13-8-8.
//  Copyright (c) 2013年 臧金晓. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
#define APP_PLIST_NAME @"AppLists"

@interface HXAppManager : NSObject <UITableViewDataSource, UITableViewDelegate>
{
    NSArray* apps;
}
SYNTHESIZE_SINGLETON_FOR_HEADER(HXAppManager)

- (void)prepareApps;
@property (nonatomic, retain) NSMutableArray* setupedApps;
@property (nonatomic, retain) NSMutableArray* unSetupedApps;

@end
