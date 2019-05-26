//
//  PopViewController.m
//  04_popView
//
//  Created by moxiaoyan on 2019/5/26.
//  Copyright © 2019 moxiaoyan. All rights reserved.
//

#import "PopViewController.h"

@interface PopViewController ()

@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.view.backgroundColor = UIColor.whiteColor;
  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  btn.backgroundColor = UIColor.redColor;
  [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:btn];
  btn.frame = CGRectMake(50, 50, 50, 50);
}

- (void)click {
  [self dismissViewControllerAnimated:YES completion:nil];
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
