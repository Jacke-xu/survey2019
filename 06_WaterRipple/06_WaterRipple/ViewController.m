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
  self.progressView = [[WWTicPodWaterRipperView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
  self.progressView.center = self.view.center;
  [self.view addSubview:self.progressView];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.progressView.progress = 0.5;
}


@end
