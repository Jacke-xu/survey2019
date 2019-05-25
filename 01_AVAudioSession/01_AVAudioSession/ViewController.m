//
//  ViewController.m
//  01_AVAudioSession
//
//  Created by moxiaoyan on 2019/3/1.
//  Copyright © 2019 moxiaoyan. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "NSString+SHA1.h"

@interface ViewController ()

@end

@implementation ViewController {
  UILabel *_lb;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  Byte
  NSData *data = [@"f" dataUsingEncoding:NSUTF8StringEncoding];
  NSLog(@"%@ %d", data, data.length);
  
//  _lb = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, 300, 300)];
//  _lb.textColor = UIColor.redColor;
//  [self.view addSubview:_lb];
//
//
//  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(audioRouteChangeListenerCallback:) name:AVAudioSessionRouteChangeNotification object:nil];
//  NSLog(@"%d", [self isHeadsetPluggedIn]);
}

- (BOOL)isHeadsetPluggedIn {
  NSArray *outputs = [[AVAudioSession sharedInstance] currentRoute].outputs;
  for (AVAudioSessionPortDescription *des in outputs) {
//    _lb.text = [NSString stringWithFormat:@"%@", des.portType];
    if ([des.portType isEqualToString:AVAudioSessionPortBluetoothA2DP] ) {
//      NSError *error;
//      BOOL isInput = [[AVAudioSession sharedInstance] setPreferredInput:des error:&error];
//      if (isInput && !error) {
//        NSLog(@"设置蓝牙耳机输入");
//      }
      _lb.text = [NSString stringWithFormat:@"%@", des.portType];
      return YES;
    } else if ([des.portType isEqualToString:AVAudioSessionPortHeadsetMic]) {
      _lb.text = [NSString stringWithFormat:@"%@", des.portType];
      return YES;
    }
  }
  return NO;
}


//回调
- (void)audioRouteChangeListenerCallback:(NSNotification*)notification {
  NSDictionary *interuptionDict = notification.userInfo;
  NSInteger routeChangeReason = [[interuptionDict valueForKey:AVAudioSessionRouteChangeReasonKey] integerValue];
  switch (routeChangeReason) {
    case AVAudioSessionRouteChangeReasonNewDeviceAvailable:
      NSLog(@"AVAudioSessionRouteChangeReasonNewDeviceAvailable");
      NSLog(@"耳机插入");
      break;
    case AVAudioSessionRouteChangeReasonOldDeviceUnavailable:
      NSLog(@"AVAudioSessionRouteChangeReasonOldDeviceUnavailable");
      NSLog(@"耳机拔出，停止播放操作");
      break;
    case AVAudioSessionRouteChangeReasonCategoryChange:
      // called at start - also when other audio wants to play
      NSLog(@"AVAudioSessionRouteChangeReasonCategoryChange");
      break;
  }
  NSLog(@"-- %d", [self isHeadsetPluggedIn]);
  if ([self isHeadsetPluggedIn]) {
    // 设置蓝牙耳机输入
    
  } else {
    // 设置手机麦克风输入
    
  }
}

@end
