//
//  AViewController.m
//  Test
//
//  Created by GeWei on 2017/9/22.
//  Copyright © 2017年 GeWei. All rights reserved.
//

#import "AViewController.h"
#import "BViewController.h"

@interface AViewController ()<BViewControllerDelegate> {
    UIViewController *_vcSource;
}

@end

@implementation AViewController

- (instancetype)initWithSourceVC:(UIViewController *)vcSource {
    self = [super init];
    if (self) {
        _vcSource = vcSource;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 120, 30)];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn setTitle:@"Push A" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnSet:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)btnSet:(UIButton *)btn {
    BViewController *bVC = [[BViewController alloc] initWithSourceVC:_vcSource];
    bVC.delegate = self;
    [self.navigationController pushViewController:bVC animated:YES];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //    self.navigationController.navigationBarHidden = YES;
        [self.navigationController setNavigationBarHidden:YES animated:NO];
//    NSLog(@"AViewController %@",self.navigationController.viewControllers);
   
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//        self.navigationController.navigationBarHidden = NO;
        [self.navigationController setNavigationBarHidden:NO animated:NO];
//    NSLog(@"AViewController.viewControllers  %@",self.navigationController.viewControllers);
//    NSLog(@"AViewController %@",self.navigationController);
//    NSLog(@"AViewController %@",self.navigationController);
}

- (IBAction)pushBcontroller:(id)sender {
    BViewController *bVC = [[BViewController alloc] init];
    bVC.delegate = self;
    [self.navigationController pushViewController:bVC animated:YES];
}


- (void)popController {
    // A控制器会显示出来
//    [self.navigationController popViewControllerAnimated:NO];
    if ([_delegate respondsToSelector:@selector(popToVCWithAVC:)]) {
        [_delegate popToVCWithAVC:self];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 关闭一层 AViewController
    if ([_delegate respondsToSelector:@selector(popToVCWithAVC:)]) {
        [_delegate popToVCWithAVC:self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
