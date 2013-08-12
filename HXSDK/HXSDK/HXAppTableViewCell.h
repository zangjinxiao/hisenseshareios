//
//  HXAppTableViewCell.h
//  LRSlideView
//
//  Created by jxZang on 13-8-8.
//  Copyright (c) 2013年 臧金晓. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ICON_PATH_ @"ICON_PATH"
#define APP_NAME_ @"APP_NAME"

@interface HXAppTableViewCell : UITableViewCell
@property (nonatomic, assign)   UIImageView*    iconView;
@property (nonatomic, assign)   UILabel*        nameLabel;
@property (nonatomic, copy)     NSString*       ICON_PATH;
@property (nonatomic, copy)     NSString*       APP_NAME;
@property (nonatomic, copy)     NSString*       SCHEMA;
//- (void)setByDictionary:(NSDictionary*)dic;
@end
