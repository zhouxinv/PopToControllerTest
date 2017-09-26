//
//  BViewController.m
//  Test
//
//  Created by GeWei on 2017/9/22.
//  Copyright © 2017年 GeWei. All rights reserved.
//

#import "BViewController.h"

@interface BViewController () {
    UIViewController *_vcSource;
}

@end

@implementation BViewController

- (instancetype)initWithSourceVC:(UIViewController *)vcSource {
    self = [super init];
    if (self) {
        _vcSource = vcSource;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 120, 30)];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn setTitle:@"我知道了" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnSet:) forControlEvents:UIControlEventTouchUpInside];
    
//    UIButton *btnpush = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 120, 30)];
//    btnpush.backgroundColor = [UIColor purpleColor];
//    [self.view addSubview:btnpush];
//    [btnpush setTitle:@"跳转下一个控制器" forState:UIControlStateNormal];
//    [btnpush addTarget:self action:@selector(btnPush:) forControlEvents:UIControlEventTouchUpInside];

}


- (void)btnSet:(UIButton *)btn {
    //调用代理关闭控制器
    if ([_delegate respondsToSelector:@selector(popController)]) {
        [_delegate popController];
    }
    
    
    // 解决方式
//    [self aaaaaaaa];
    
    
}

//- (void)btnPush:(UIButton *)btn {
// 
//}

- (void)aaaaaaaa {
    //目前的解决办法 在调用代理时将NavigationBar隐藏关闭, 但是动画效果不理想
//    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
    if ([_delegate respondsToSelector:@selector(popController)]) {
        [_delegate popController];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    NSLog(@"BViewController数组 %@",self.navigationController.viewControllers);
    
}


- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    if ([_delegate respondsToSelector:@selector(popController)]) {
        [_delegate popController];
    }
    
    // [self.navigationController popToViewController:self animated:YES]; 添加动画后 这个地方的地址都为空了
    NSLog(@"BViewController数组 %@",self.navigationController.viewControllers);
    NSLog(@"BViewController %@",self.navigationController);

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
