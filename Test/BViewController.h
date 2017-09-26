//
//  BViewController.h
//  Test
//
//  Created by GeWei on 2017/9/22.
//  Copyright © 2017年 GeWei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BViewControllerDelegate <NSObject>

- (void)popController;

@end

@interface BViewController : UIViewController

@property (nonatomic, weak) id<BViewControllerDelegate> delegate;

- (instancetype)initWithSourceVC:(UIViewController *)vcSource;

@end
