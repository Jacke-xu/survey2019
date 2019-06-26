//
//  ViewController.swift
//  06_CircleLoading
//
//  Created by moxiaoyan on 2019/6/21.
//  Copyright © 2019 moxiaoyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  private var gradientLayer: CALayer?
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // swift 版本
    let view = CircleLoadingView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    view.center = self.view.center
    self.view.addSubview(view)
    
    // OC 版本
    let view1 = MOCircleLoadingView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    view1.center = self.view.center
    self.view.addSubview(view1)
  }
  
}

