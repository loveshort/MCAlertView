//
//  ViewController.m
//  MCAlertView
//
//  Created by mac on 2018/11/20.
//  Copyright © 2018 MCDev. All rights reserved.
//

#import "ViewController.h"
#import "MCAlertView/MCAlertView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [MCAlertView initAlertViewithText:@"网络请求正在请求你可以试试"];
    
}


@end
