//
//  HXTools.m
//  LRSlideView
//
//  Created by jxZang on 13-8-8.
//  Copyright (c) 2013年 臧金晓. All rights reserved.
//

#import "HXTools.h"

@implementation HXTools

@end

@implementation UIViewController (Frame)

- (CGRect)frame
{
    return self.view.frame;
}

- (CGPoint)origin
{
    return self.view.frame.origin;
}

- (float)x
{
    return self.view.frame.origin.x;
}

- (float)y
{
    return self.view.frame.origin.y;
}

- (float)width
{
    return self.view.frame.size.width;
}

- (float)height
{
    return  self.view.frame.size.height;
}

- (void)setY:(float)y
{
    CGRect r = self.frame;
    r.origin.y = y;
    [self.view setFrame:r];
}

- (void)setX:(float)x
{
    CGRect r = self.frame;
    r.origin.x = x;
    [self.view setFrame:r];
}

- (void)setFrame:(CGRect)frame
{
    [self.view setFrame:frame];
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect r = self.frame;
    r.origin = origin;
    [self.view setFrame:r];
}

- (void)setHeight:(float)height
{
    CGRect r = self.frame;
    r.size.height = height;
    [self.view setFrame:r];
}

- (void)setWidth:(float)width
{
    CGRect r = self.frame;
    r.size.width = width;
    [self.view setFrame:r];
}

-(void)addSubview:(UIView *)sView
{
    [self.view addSubview:sView];
}

@end

@implementation UIView (Frame)

- (CGPoint)origin
{
    return self.frame.origin;
}

- (float)x
{
    return self.frame.origin.x;
}

- (float)y
{
    return self.frame.origin.y;
}

- (float)width
{
    return self.frame.size.width;
}

- (float)height
{
    return  self.frame.size.height;
}

- (void)setY:(float)y
{
    CGRect r = self.frame;
    r.origin.y = y;
    [self setFrame:r];
}

- (void)setX:(float)x
{
    CGRect r = self.frame;
    r.origin.x = x;
    [self setFrame:r];
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect r = self.frame;
    r.origin = origin;
    [self setFrame:r];
}

- (void)setHeight:(float)height
{
    CGRect r = self.frame;
    r.size.height = height;
    [self setFrame:r];
}

- (void)setWidth:(float)width
{
    CGRect r = self.frame;
    r.size.width = width;
    [self setFrame:r];
}

@end

UIImage* loadImage(NSString *imageName)
{
    return [UIImage imageNamed:imageName];
    return [[UIImage imageNamed:imageName] resizableImageWithCapInsets:UIEdgeInsetsMake(0.5, 0.5, 0.5, 0.5)];
}

UIColor* UIColorWithHex(int inNumber)
{
    return [UIColor colorWithRed:inNumber / 0x10000 / 255.0f  green:inNumber / 0x100 % 0x100 / 255.0f blue:inNumber % 0x100 / 255.0f alpha:1.0];
}

@implementation NSObject (Dictionary)

- (void)setByDictionary:(NSDictionary*)dic
{
    for (NSString* key in dic.allKeys)
    {
        [self setValue:dic[key] forKey:key];
    }
}

@end
