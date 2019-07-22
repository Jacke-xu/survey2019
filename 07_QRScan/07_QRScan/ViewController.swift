//
//  ViewController.swift
//  07_QRScan
//
//  Created by moxiaoyan on 2019/7/11.
//  Copyright © 2019 moxiaoyan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let btn = UIButton(type: .custom)
    btn.frame = CGRect(x: 0, y: 0, width: 120, height: 50)
    btn.center = self.view.center
    btn.setTitle("扫描二维码", for: .normal)
    btn.setTitleColor(.red, for: .normal)
    btn.addTarget(self, action: #selector(clickScan), for: .touchUpInside)
    self.view.addSubview(btn)
    
  }
  
  @objc func clickScan() {
    let nav = UINavigationController(rootViewController: MOQRScanViewController())
    self.present(nav, animated: true, completion: nil)
  }

}
