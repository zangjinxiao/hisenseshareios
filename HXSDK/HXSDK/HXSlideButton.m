//
//  HXSlideButton.m
//  LRSlideView
//
//  Created by jxZang on 13-8-6.
//  Copyright (c) 2013年 臧金晓. All rights reserved.
//

#import "HXSlideButton.h"
#import "HXTools.h"
#import "HXScaleWindow.h"

@implementation HXSlideButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        moveFlag = 1;
        [self setBackgroundColor:[UIColor greenColor]];
    }
    return self;
}

- (UIView *)actView
{
    if (_actView)
    {
        return _actView;
    }
    return self.window;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setBackgroundColor:[UIColor yellowColor]];
    UITouch* t = touches.anyObject;
    beginPoint = [t locationInView:self.baseView];
    beginFrame = self.actView.frame;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* t = touches.anyObject;
    CGPoint p = [t locationInView:self.baseView];
    moveFlag = p.x - lastX;
    lastX = p.x;
    CGRect frame = beginFrame;
    float tempX = MAX(MIN(frame.origin.x + p.x - beginPoint.x,self.lpad), 0);
    [self.actView setX:tempX];
    HXScaleWindow* scaleWindow = (HXScaleWindow*)self.baseView;
    [scaleWindow setScale:0.85 + tempX / _lpad * 0.15];
}

- (void)leftMove
{
    [UIView animateWithDuration:self.actView.x / self.lpad * 0.4 animations:^{
        [self.actView setX:0];
        HXScaleWindow* scaleWindow = (HXScaleWindow*)self.baseView;
        [scaleWindow setScale:0.85];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)rightMove
{
    [UIView animateWithDuration:(self.lpad - self.actView.x) / self.lpad * 0.4 animations:^{
        [self.actView setX:self.lpad];
        HXScaleWindow* scaleWindow = (HXScaleWindow*)self.baseView;
        [scaleWindow setScale:1.0];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setBackgroundColor:[UIColor greenColor]];
    if (moveFlag > 0)
    {
        [self rightMove];
    }
    else if (moveFlag < 0)
    {
        [self leftMove];
    }
    else
    {
        if (self.actView.x == 0)
        {
            [self rightMove];
        }
        else
        {
            [self leftMove];
        }
    }
    moveFlag = 0;
}

- (void)setActViewFrame:(CGRect)inFrame
{
    [_actView setFrame:inFrame];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)setBaseView:(UIView *)baseView
{
    _baseView = baseView;
    HXScaleWindow* scaleWindow = (HXScaleWindow*)_baseView;
    [scaleWindow setScale:0.85];
}


@end
