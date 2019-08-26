//
//  ViewController.m
//  04_popView
//
//  Created by moxiaoyan on 2019/5/26.
//  Copyright © 2019 moxiaoyan. All rights reserved.
//

#import "ViewController.h"
#import "PopViewController.h"

@interface ViewController () <UIAdaptivePresentationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  btn.backgroundColor = UIColor.redColor;
  [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:btn];
  btn.frame = CGRectMake(50, 50, 50, 50);
}

- (void)click {
  PopViewController *vc = [[PopViewController alloc] init];
  vc.modalPresentationStyle = UIModalPresentationFormSheet;
  vc.preferredContentSize = CGSizeMake(100, 100);
  vc.presentationController.delegate = self;
  [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - UIAdaptivePresentationControllerDelegate
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
  return UIModalPresentationNone;
}

@end
