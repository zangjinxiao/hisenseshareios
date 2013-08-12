//
//  HXAppManager.m
//  LRSlideView
//
//  Created by jxZang on 13-8-8.
//  Copyright (c) 2013年 臧金晓. All rights reserved.
//

#import "HXAppManager.h"
#import "HXAppTableViewCell.h"
#import "HXTools.h"

@implementation HXAppManager

SYNTHESIZE_SINGLETON_FOR_CLASS(HXAppManager)

- (void)dealloc
{
    [apps release], apps = nil;
    self.setupedApps = nil;
    self.unSetupedApps = nil;
    [super dealloc];
}

- (NSString*)plistPath
{
    return [[NSBundle mainBundle] pathForResource:APP_PLIST_NAME ofType:@"plist"];
}

- (id)init
{
    if (self = [super init])
    {
        self.setupedApps = [NSMutableArray arrayWithCapacity:0];
        self.unSetupedApps = [NSMutableArray arrayWithCapacity:0];
        [self prepareApps];
    }
    return self;
}

-(void)prepareApps
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        apps = [[NSArray alloc] initWithContentsOfFile:[self plistPath]];
        for (NSDictionary* dic in apps)
        {
            NSURL* url = [NSURL URLWithString:[[dic valueForKey:@"SCHEMA"] stringByAppendingString:@"://test"]];
            if ([[UIApplication sharedApplication]canOpenURL:url])
            {
                [self.setupedApps addObject:dic];
            }
            else
            {
                [self.unSetupedApps addObject:dic];
            }
        }
    });    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return self.setupedApps.count;
            break;
        case 1:
            return self.unSetupedApps.count;
            break;
        default:
            return 0;
            break;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* appid = @"appidentification";
    HXAppTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:appid];
    if (! cell)
    {
        cell = [[[HXAppTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:appid] autorelease];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    switch (indexPath.section) {
        case 0:
            [cell setByDictionary:[self.setupedApps objectAtIndex:indexPath.row]];
            break;
        case 1:
            [cell setByDictionary:[self.unSetupedApps objectAtIndex:indexPath.row]];
            break;
        default:
            break;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[[[self.setupedApps objectAtIndex:indexPath.row] objectForKey:@"SCHEMA"]stringByAppendingString:@"://test"]]];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return @"已安装";
            break;
        case 1:
            return @"未安装";
            break;
        default:
            return @"";
            break;
    }
}

@end
