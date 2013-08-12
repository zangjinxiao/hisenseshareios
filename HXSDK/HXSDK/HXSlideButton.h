//
//  HXSlideButton.h
//  LRSlideView
//
//  Created by jxZang on 13-8-6.
//  Copyright (c) 2013年 臧金晓. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXSlideButton : UIView
{
    CGPoint beginPoint;
    CGRect beginFrame;
    float moveFlag;
    float lastX;
}

@property (nonatomic, assign) float     lpad;
@property (nonatomic, assign) float     rpad;
@property (nonatomic, assign) UIView*   baseView;
@property (nonatomic, assign) UIView*   actView;

@end
