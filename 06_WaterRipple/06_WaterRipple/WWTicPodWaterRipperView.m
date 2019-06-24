//
//  WWTicPodWaterRipperView.m
//  06_WaterRipple
//
//  Created by moxiaoyan on 2019/6/24.
//  Copyright © 2019 moxiaoyan. All rights reserved.
//

#import "WWTicPodWaterRipperView.h"

@implementation WWTicPodWaterRipperView {
  UIImageView *_firstImgV;
  UIImageView *_secondImgV;
  UILabel *_progressLb;
}

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    self.bounds = CGRectMake(0, 0, MIN(frame.size.width, frame.size.height), MIN(frame.size.width, frame.size.height));
    self.layer.cornerRadius = MIN(frame.size.width, frame.size.height) * 0.5;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:248/255.0 alpha:1].CGColor;
    self.layer.borderWidth = 5.0f;
    
    _secondImgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ticpod_water_ripple_second"]];
    _secondImgV.frame = CGRectMake(-self.bounds.size.width, 0, self.bounds.size.width * 2, self.bounds.size.height);
    _firstImgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ticpod_water_ripple_frist"]];
    _firstImgV.frame = CGRectMake(-self.bounds.size.width, 0, self.bounds.size.width * 2, self.bounds.size.height);
    [self addSubview:_secondImgV];
    [self addSubview:_firstImgV];
    
    _progressLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    _progressLb.font = [UIFont systemFontOfSize:60];
    _progressLb.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_progressLb];
  }
  return self;
}

- (void)setProgress:(CGFloat)progress {
  _progress = progress;
  _progressLb.text = [NSString stringWithFormat:@"%ld%%", [[NSNumber numberWithFloat:progress * 100] integerValue]];
  if (progress > 0.5) {
    _progressLb.textColor = [UIColor colorWithRed:255.0/255.0 green:240.0/255.0 blue:245.0/255.0 alpha:progress];//[UIColor colorWithWhite:1 alpha:progress];
  } else {
    _progressLb.textColor = [UIColor colorWithRed:15.0/255.0 green:197.0/255.0 blue:177.0/255.0 alpha:1-progress];
  }
  CGFloat y = self.bounds.size.height * (1-progress);
  _firstImgV.frame = CGRectMake(-self.bounds.size.width, y, 2*self.bounds.size.width, self.bounds.size.height);
  _secondImgV.frame = CGRectMake(-self.bounds.size.width, y, 2*self.bounds.size.width, self.bounds.size.height);

  CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
  anim.duration = 3;
  anim.fromValue = @(0);
  anim.toValue = @(self.bounds.size.width);
  anim.repeatCount = MAXFLOAT;
  anim.fillMode = kCAFillModeForwards;
  [_firstImgV.layer addAnimation:anim forKey:@"translation.x"];
  [_secondImgV.layer addAnimation:anim forKey:@"translation.x"];
}

@end
