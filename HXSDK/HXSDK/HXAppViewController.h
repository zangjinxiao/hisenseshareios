//
//  HXAppViewController.h
//  HXSDK
//
//  Created by jxZang on 13-8-12.
//  Copyright (c) 2013年 jxZang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Singleton.h"

@interface HXAppViewController : UIViewController
{
    UINavigationBar* navBar;
}
SYNTHESIZE_SINGLETON_FOR_HEADER(HXAppViewController)

@end
