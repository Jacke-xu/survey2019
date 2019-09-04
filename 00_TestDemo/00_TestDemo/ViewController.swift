//
//  ViewController.swift
//  00_TestDemo
//
//  Created by moxiaoyan on 2019/2/24.
//  Copyright © 2019 moxiaoyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

//    testImageTransform()
//    testStackView()
//    textGradientLayer()
    print(twoSum([2, 7, 11, 15], 9))
  }
  
  func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for i in 0..<nums.count {
      for j in i+1..<nums.count {
        if nums[i] + nums[j] == target {
          return [i, j]
        }
      }
    }
    return []
  }

  func textGradientLayer() { // UIView 颜色渐变
    let rect = CGRect(x: 30, y: 60, width: 200, height: 200)
    let gradientView = UIView(frame: rect)
    
    let gradientLayer = CAGradientLayer()  //新建一个渐变层
    gradientLayer.frame = gradientView.frame
    
    let fromColor = UIColor.yellow.cgColor
    let midColor = UIColor.red.cgColor
    let toColor = UIColor.purple.cgColor
    gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
      //[fromColor,midColor,toColor]//将渐变层的颜色属性设置为由三个颜色所构建的数组
    
    view.layer.addSublayer(gradientLayer) //将设置好的渐变层添加到视图对象的层中
    self.view.addSubview(gradientView)
  }
  
  func testStackView() { // stack 子视图
    let img1 = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    img1.backgroundColor = .red
    
    let img2 = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    img2.backgroundColor = .green
    
    let img3 = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    img3.backgroundColor = .blue
    
    let stackView = UIStackView(arrangedSubviews: [img1, img2])
    stackView.frame = CGRect(x: 0, y: 100, width: 100, height: 100);
    stackView.axis = .horizontal
    stackView.alignment = .fill
    stackView.distribution = .fillEqually
    stackView.spacing = 4
    stackView.backgroundColor = .cyan
//    self.view.addSubview(stackView)
    
    let stackView2 = UIStackView(arrangedSubviews: [stackView, img3])
    stackView2.frame = CGRect(x: 0, y: 100, width:200, height: 50);
    stackView2.axis = .horizontal
    stackView2.alignment = .fill
    stackView2.distribution = .fillEqually
    stackView2.spacing = 4
    stackView2.backgroundColor = .cyan
    self.view.addSubview(stackView2)
  }

  func testImageTransform() { // UIImageView 翻转
    // 测试 设置图片后翻转 和 翻转后设置图片
    let imgV1 = UIImageView(frame: CGRect(x: 50, y: 50, width: 80, height: 80))
    imgV1.image = UIImage(named: "ticpod_translate_normal")
    self.view.addSubview(imgV1)
    imgV1.transform = CGAffineTransform(rotationAngle: .pi)
    //    // CGAffineTransform 是按照原始角度旋转的, 所以写两次是不会旋转回去的
    //    imgV1.transform = CGAffineTransform(rotationAngle: .pi)
    //
    //    // OC的`CGAffineTransformRotate`方法 用 transform.rotated(by: Float) 代替
    //    // 在 imgV1.transform 的 基础上旋转角度
    //    imgV1.transform = imgV1.transform.rotated(by: .pi)


    let imgV2 = UIImageView(frame: CGRect(x: 50, y: 200, width: 80, height: 80))
    self.view.addSubview(imgV2)
    imgV2.transform = CGAffineTransform(rotationAngle: .pi)
    imgV2.image = UIImage(named: "ticpod_translate_normal")
    // 结论: 不管是旋转前设置image 还是 旋转后设置image  都是一样的
    // (图片是按照当前`View的正方向`为`正方向`的)
  }

}

