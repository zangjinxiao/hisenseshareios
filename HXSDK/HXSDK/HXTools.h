//
//  HXTools.h
//  LRSlideView
//
//  Created by jxZang on 13-8-8.
//  Copyright (c) 2013年 臧金晓. All rights reserved.
//

#import <Foundation/Foundation.h>
#define AppTopBackgroundImageName @"title背景"
#define Class2BackgroundImageName @"二级分类背景"

@interface HXTools : NSObject

@end

@interface NSObject (Dictionary)
- (void)setByDictionary:(NSDictionary*)dic;
@end

@interface UIViewController (Frame)
@property (nonatomic, assign) CGRect    frame;
@property (nonatomic, assign) CGPoint   origin;
@property (nonatomic, assign) float     x;
@property (nonatomic, assign) float     y;
@property (nonatomic, assign) float     width;
@property (nonatomic, assign) float     height;
- (void)addSubview:(UIView*)sView;
@end

@interface UIView (Frame)
@property (nonatomic, assign) CGPoint   origin;
@property (nonatomic, assign) float     x;
@property (nonatomic, assign) float     y;
@property (nonatomic, assign) float     width;
@property (nonatomic, assign) float     height;
@end

UIImage* loadImage(NSString* imageName);
UIColor* UIColorWithHex(int inNumber);