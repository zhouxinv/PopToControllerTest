//
//  ViewController.m
//  Test
//
//  Created by GeWei on 2017/9/22.
//  Copyright © 2017年 GeWei. All rights reserved.
//

#import "ViewController.h"
#import "AViewController.h"


@interface ViewController ()<AViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.title = @"VC Controller";
}

- (IBAction)pushA:(id)sender {
    AViewController *view = [[AViewController alloc] initWithSourceVC:self];
    view.delegate = self;
    [self.navigationController pushViewController:view animated:YES];
}


- (void)popToVCWithAVC:(AViewController*)Avc {
//    [self.navigationController popToViewController:self animated:NO];
    [self.navigationController popToViewController:self animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
