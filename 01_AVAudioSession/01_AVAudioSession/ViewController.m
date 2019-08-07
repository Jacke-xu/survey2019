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
  
  NSString *str1 = @"9011";
  NSString *str2 = @"a011";
  NSString *str3 = @"b011";

  NSLog(@"%i", [str2 compare:str1] != NSOrderedDescending);
  NSLog(@"%i", [str3 compare:str1] != NSOrderedDescending);
  NSLog(@"%i", [str3 compare:str2] != NSOrderedDescending);
}



@end
