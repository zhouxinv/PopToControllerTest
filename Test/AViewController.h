//
//  AViewController.h
//  Test
//
//  Created by GeWei on 2017/9/22.
//  Copyright © 2017年 GeWei. All rights reserved.
//

#import <UIKit/UIKit.h>


@class AViewController;
@protocol AViewControllerDelegate <NSObject>

- (void)popToVCWithAVC:(AViewController*)Avc;

@end

@interface AViewController : UIViewController

@property (nonatomic, weak) id<AViewControllerDelegate> delegate;

- (instancetype)initWithSourceVC:(UIViewController *)vcSource;

@end
