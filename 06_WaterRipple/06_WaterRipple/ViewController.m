//
//  ViewController.m
//  06_WaterRipple
//
//  Created by moxiaoyan on 2019/6/24.
//  Copyright © 2019 moxiaoyan. All rights reserved.
//

#import "ViewController.h"
#import "WWTicPodWaterRipperView.h"

@interface ViewController ()
@property (nonatomic, strong) WWTicPodWaterRipperView *progressView;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // 水波进度
  self.progressView = [[WWTicPodWaterRipperView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
  self.progressView.center = self.view.center;
  self.progressView.progress = 0.0;
  [self.view addSubview:self.progressView];
  
  UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(90, CGRectGetMaxY(self.progressView.frame)+20, 200, 20)];
  slider.minimumValue = 0.0;
  slider.maximumValue = 1.0;
  [self.view addSubview:slider];
  [slider addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
}

- (void)changeValue:(UISlider *)slider {
  self.progressView.progress = slider.value;
}


@end
