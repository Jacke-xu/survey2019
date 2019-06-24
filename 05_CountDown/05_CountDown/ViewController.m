//
//  ViewController.m
//  05_CountDown
//
//  Created by moxiaoyan on 2019/6/7.
//  Copyright © 2019 moxiaoyan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  btn.backgroundColor = [UIColor redColor];
  btn.frame = CGRectMake(100, 100, 50, 50);
  [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:btn];
  
  [self performSelector:@selector(showAlert) withObject:@"a" afterDelay:10];
}

- (void)clickBtn:(UIButton *)btn {
  [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(showAlert) object:@"a"];
}

- (void)showAlert {
  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
  [self presentViewController:alert animated:YES completion:nil];
}

@end
