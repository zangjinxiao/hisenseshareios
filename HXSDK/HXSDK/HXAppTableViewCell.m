//
//  HXAppTableViewCell.m
//  LRSlideView
//
//  Created by jxZang on 13-8-8.
//  Copyright (c) 2013年 臧金晓. All rights reserved.
//

#import "HXAppTableViewCell.h"
#import "HXTools.h"
#import "HXDefaults.h"

@implementation HXAppTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:(reuseIdentifier ? reuseIdentifier : NSStringFromClass(self.class))];
    if (self)
    {
        _iconView = [[[UIImageView alloc] initWithFrame:CGRectZero] autorelease];
        _nameLabel = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
        [_nameLabel setFont:[UIFont systemFontOfSize:22]];
        [_nameLabel setTextColor:UIColorWithHex(0x28292a)];
        [_nameLabel setText:@" "];
        [_nameLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview:_iconView];
        [self addSubview:_nameLabel];
        UIView* backgroundView = [[[UIView alloc] init] autorelease];
        [backgroundView setBackgroundColor:[UIColor colorWithPatternImage:loadImage(Class2BackgroundImageName)]];
        [self setSelectionStyle:UITableViewCellSelectionStyleGray];
    }
    return self;
}

- (void)reloadFrames
{
    [_iconView setFrame:CGRectMake(15, 7, 30, 30)];
    [_nameLabel sizeToFit];
    CGRect labelFrame = _nameLabel.frame;
    labelFrame.origin = CGPointMake(60, 45 / 2.0f - labelFrame.size.height / 2.0f);
    labelFrame.size.width = self.frame.size.width - 60;
    [_nameLabel setFrame:labelFrame];
}

+ (HXAppTableViewCell*)cellWithDictionary:(NSDictionary*)dic
{
    HXAppTableViewCell* rt = [[[HXAppTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil] autorelease];
    [rt setByDictionary:dic];
    return rt;
}

- (void)setByDictionary:(NSDictionary*)dic
{
    [super setByDictionary:dic];
    [_nameLabel setText:self.APP_NAME];
    [_iconView setImage:loadImage(self.ICON_PATH)];
    [self reloadFrames];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
