//
//  ViewController.swift
//  02_UIStackView
//
//  Created by 莫晓卉 on 2019/3/23.
//  Copyright © 2019 莫晓卉. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let redView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    redView.backgroundColor = .red
    let blueView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    blueView.backgroundColor = .blue
    let greenView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    greenView.backgroundColor = .green

    let stackView = UIStackView(arrangedSubviews: [redView, blueView, greenView])
    stackView.axis = .horizontal //.vertical

    // 主要设置`非轴方向`子视图的对齐方式
    stackView.alignment = .fill           // 子视图填充stack
    stackView.alignment = .leading        // 子视图左对齐 (axis为垂直方向而言)
    stackView.alignment = .top            // 子视图顶部对齐 (axis为水平方向而言)
    stackView.alignment = .firstBaseline  // 按照第一个子视图的文字的第一行对齐，同时保证高度最大的子视图底部对齐（只在axis为水平方向有效）
    stackView.alignment = .center         // 子视图居中对齐
    stackView.alignment = .trailing       // 子视图右对齐 (axis为垂直方向而言)
    stackView.alignment = .bottom         // 子视图底部对齐 (axis为水平方向而言)
    stackView.alignment = .lastBaseline   // 按照最后一个子视图的文字的最后一行对齐，同时保证高度最大的子视图顶部对齐（只在axis为水平方向有效

    // 设置轴方向上子视图的分布比例（axis是水平:设置子视图的宽度，axis是垂直:设置子视图的高度）
    stackView.distribution = .fill                // 填充, 优先级一样, 拉伸最后一个
    stackView.distribution = .fillEqually         // 轴方向上: 等宽/等高
    stackView.distribution = .fillProportionally  // 按原先子视图设置的 宽/高 比来填充
    stackView.distribution = .equalSpacing        // 保持子视图宽高, 间距保持一致
    stackView.distribution = .equalCentering      // 子视图`中心点`间的距离一致

    stackView.spacing = 10
    
    stackView.frame = CGRect(x: 50, y: 100, width: 300, height: 100)
    self.view.addSubview(stackView)
    
  }


}

