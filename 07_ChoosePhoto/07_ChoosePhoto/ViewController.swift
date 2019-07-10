//
//  ViewController.swift
//  07_ChoosePhoto
//
//  Created by moxiaoyan on 2019/7/10.
//  Copyright © 2019 moxiaoyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  private let imgV = UIImageView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))

  override func viewDidLoad() {
    super.viewDidLoad()

    let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 44))
    btn.setTitle("选择照片", for: .normal)
    btn.setTitleColor(.red, for: .normal)
    btn.addTarget(self, action: #selector(clickBtn), for: .touchUpInside)
    btn.center = self.view.center
    self.view.addSubview(btn)
    
    self.view.addSubview(imgV)
  }

  @objc func clickBtn() {
    let alert = UIAlertController(title: "title", message: "message", preferredStyle: .actionSheet)
    let camera = UIAlertAction(title: "拍照", style: .default) { (action) in
      self.camera()
    }
    alert.addAction(camera)
    let photo = UIAlertAction(title: "本地照片", style: .default) { (action) in
      self.photo()
    }
    alert.addAction(photo)
    let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
    alert.addAction(cancel)
    self.present(alert, animated: true, completion: nil)
  }
  
  func camera() {
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
      let cameraPicker = UIImagePickerController()
      cameraPicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
      cameraPicker.allowsEditing = true
      cameraPicker.sourceType = .camera
      self.present(cameraPicker, animated: true, completion: nil)
    } else {
      print("不支持拍照")
    }
  }
  func photo() {
    let photoPicker = UIImagePickerController()
    photoPicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
    photoPicker.allowsEditing = true
    photoPicker.sourceType = .photoLibrary
    self.present(photoPicker, animated: true, completion: nil)
  }

}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    print("点击照片：\(info)")
    let image : UIImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
    imgV.image = image;
    self.dismiss(animated: true, completion: nil)
  }
}

