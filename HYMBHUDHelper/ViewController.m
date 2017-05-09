//
//  ViewController.m
//  HYMBHUDHelper
//
//  Created by Apple on 2017/5/5.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "HYMBHUDHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [HYMBHUDHelper showHUDWithCustomeTextTips:@"滴滴滴,老司机开车了"];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
