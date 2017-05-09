//
//  HYMBHUDHelper.h
//  HYMBHUDHelper
//
//  Created by Apple on 2017/5/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HYMBHUDHelper : NSObject

+ (void)showCenterText:(NSString *)text;

+ (void)showMBProgressHud;

+ (void)showHUDWithCustomeTextTips:(NSString *)text;

+ (void)hiddenMBProgressHud;

@end
