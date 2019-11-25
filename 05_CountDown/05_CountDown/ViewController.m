//
//  ViewController.m
//  05_CountDown
//
//  Created by moxiaoyan on 2019/6/7.
//  Copyright © 2019 moxiaoyan. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()
@property(nonatomic, strong) MPRemoteCommandCenter *commandCenter;
@property(nonatomic, strong) AVPlayer *avPlayer;
@property(nonatomic, strong) AVPlayerItem *avItem;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
  btn.backgroundColor = [UIColor redColor];
  btn.frame = CGRectMake(100, 100, 50, 50);
  [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:btn];
  
//  [self performSelector:@selector(showAlert) withObject:@"a" afterDelay:10];
}

// 控制中心 控制播放音乐
- (void)clickPlay {
  [self showLockScreenInfo];
  MPNowPlayingInfoCenter *playingInfoCenter = [MPNowPlayingInfoCenter defaultCenter];
  NSMutableDictionary *playingInfoDict = [NSMutableDictionary dictionary];
  [playingInfoDict setObject:@"泡沫" forKey:MPMediaItemPropertyAlbumTitle];
  [playingInfoDict setObject:@"邓紫棋" forKey:MPMediaItemPropertyArtist];
  [playingInfoDict setObject:@"2000" forKey:MPMediaItemPropertyPlaybackDuration];
  [playingInfoDict setObject:@"1" forKey:MPNowPlayingInfoPropertyElapsedPlaybackTime];
  [MPRemoteCommandCenter sharedCommandCenter].previousTrackCommand.enabled = YES;
  [MPRemoteCommandCenter sharedCommandCenter].changePlaybackPositionCommand.enabled = YES;
  [MPRemoteCommandCenter sharedCommandCenter].nextTrackCommand.enabled = YES;
  playingInfoCenter.nowPlayingInfo = playingInfoDict;
  
  NSString *file = [[NSBundle mainBundle] pathForResource:@"news" ofType:@"mp3"];
  NSURL *url = [NSURL fileURLWithPath:file];
  _avItem = [[AVPlayerItem alloc] initWithURL:url];
  [_avItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
  _avPlayer = [[AVPlayer alloc] initWithPlayerItem:_avItem];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(currentAudioPlayFinished) name:AVPlayerItemDidPlayToEndTimeNotification object:_avItem];
  [_avPlayer play];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
  if ([keyPath isEqualToString:@"status"]) {
    switch (_avPlayer.status) {
      case AVPlayerStatusFailed: {
        NSLog(@"ticpodDebug: play failed");
//        [self currentAudioPlayFinished];
      } break;
      default: break;
    }
  }
}

- (void)showLockScreenInfo {
  [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
  if (!_commandCenter) {
    __weak typeof(self) weakSelf = self;
    MPRemoteCommandCenter *commandCenter = [MPRemoteCommandCenter sharedCommandCenter];
    _commandCenter = commandCenter;
    // 远程控制播放
    [commandCenter.pauseCommand addTargetWithHandler:^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *_Nonnull event) {
      NSLog(@"moxiaoyan 远程控制播放");
      return MPRemoteCommandHandlerStatusSuccess;
    }];
    // 远程控制暂停
    [commandCenter.playCommand addTargetWithHandler:^MPRemoteCommandHandlerStatus(MPRemoteCommandEvent *_Nonnull event) {
      NSLog(@"moxiaoyan 远程控制暂停");
      return MPRemoteCommandHandlerStatusSuccess;
    }];
  }
}

- (void)clickBtn:(UIButton *)btn {
  [self clickPlay];
//  [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(showAlert) object:@"a"];
}

//- (void)showAlert {
//  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
//  [self presentViewController:alert animated:YES completion:nil];
//}

@end
