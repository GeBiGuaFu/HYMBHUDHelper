//
//  HYMBHUDHelper.m
//  HYMBHUDHelper
//
//  Created by Apple on 2017/5/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "HYMBHUDHelper.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"

#define kWindow ((AppDelegate *)([UIApplication sharedApplication].delegate)).window

//默认网络提示
static NSString *const kLoadingMessage = @"加载中...";
//默认简短提示显示时间
static CGFloat const kShowTime = 2.0;
//默认超时时间
static NSTimeInterval const interval = 30.0;
//手势是否可用,默认YES
static BOOL isAvalibleTouch = YES;

@implementation HYMBHUDHelper


#pragma mark - 显示文字提示
+ (void)showCenterText:(NSString *)text{
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([MBProgressHUD HUDForView:kWindow]) {
            [MBProgressHUD hideHUDForView:kWindow animated:NO];
        }
        MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:kWindow animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.text = text;
        hud.label.textColor = [UIColor whiteColor];
        hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        hud.bezelView.color = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.7];
        hud.backgroundView.color = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.2];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [hud.backgroundView addGestureRecognizer:tap];
        
        hud.removeFromSuperViewOnHide = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kShowTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
        });
    });
}

#pragma mark - 显示提示框
+ (void)showMBProgressHud{
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([MBProgressHUD HUDForView:kWindow]) {
            if ([MBProgressHUD HUDForView:kWindow].mode == MBProgressHUDModeText) {
                [MBProgressHUD hideHUDForView:kWindow animated:NO];
            }else
            {
                return;
            }
        }
        MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:kWindow animated:YES];
        hud.mode = MBProgressHUDModeIndeterminate;
        hud.detailsLabel.text = kLoadingMessage;
        hud.contentColor = [UIColor whiteColor];
        hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        hud.bezelView.color = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.7];
        hud.backgroundView.color = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.2];
        hud.removeFromSuperViewOnHide = YES;
    });
}

#pragma mark - 显示自定义文字提示框
+ (void)showHUDWithCustomeTextTips:(NSString *)text
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([MBProgressHUD HUDForView:kWindow]) {
            [MBProgressHUD hideHUDForView:kWindow animated:NO];
        }
        MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:kWindow animated:YES];
        hud.detailsLabel.text = text;
        hud.detailsLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        hud.contentColor = [UIColor whiteColor];
        hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
        hud.bezelView.color = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.7];
        hud.backgroundView.color = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.2];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [hud.backgroundView addGestureRecognizer:tap];
        hud.removeFromSuperViewOnHide = YES;

    });
}

#pragma mark - 隐藏提示框
+ (void)hiddenMBProgressHud
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:kWindow animated:YES];
    });
}

#pragma mark - tap
+ (void)tap:(UITapGestureRecognizer *)sender{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:kWindow animated:YES];
    });
}


@end
