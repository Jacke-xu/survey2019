//
//  ViewController.m
//  01_AVAudioSession
//
//  Created by moxiaoyan on 2019/3/1.
//  Copyright © 2019 moxiaoyan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  NSArray *arr1 = nil;
  NSArray *arr2 = @[];

  if (arr1.count > 0) {
    NSLog(@"arra1: %@", arr1);
  }

}

- (void)groupTest {
  // 等待所有请求回调后执行
  dispatch_group_t group = dispatch_group_create();
  
  dispatch_group_enter(group);
  NSLog(@"执行1");
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    dispatch_group_leave(group);
    NSLog(@"完成1");
  });
  
  dispatch_group_enter(group);
  NSLog(@"执行2");
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    dispatch_group_leave(group);
    NSLog(@"完成2");
  });
  
  dispatch_group_enter(group);
  NSLog(@"执行3");
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    dispatch_group_leave(group);
    NSLog(@"完成3");
  });
  
  dispatch_group_notify(group, dispatch_get_main_queue(), ^{
    NSLog(@"都完成后，执行");
  });
}


@end
