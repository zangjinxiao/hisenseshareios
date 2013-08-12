//
//  HXScaleWindow.m
//  HXSDK
//
//  Created by jxZang on 13-8-12.
//  Copyright (c) 2013年 jxZang. All rights reserved.
//

#import "HXScaleWindow.h"
#import <QuartzCore/QuartzCore.h>

@implementation HXScaleWindow

-(void)setScale:(float)inScale
{
    self.layer.transform = CATransform3DMakeScale(inScale, inScale, 1);
}

@end
