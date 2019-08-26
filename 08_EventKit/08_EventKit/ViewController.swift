//
//  ViewController.swift
//  08_EventKit
//
//  Created by moxiaoyan on 2019/8/20.
//  Copyright © 2019 moxiaoyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let calenderBtn = UIButton(type: .custom)
    calenderBtn.frame = CGRect(x: 50, y: 80, width: 100, height: 50)
    calenderBtn.setTitle("Calender", for: .normal)
    calenderBtn.setTitleColor(.red, for: .normal)
    calenderBtn.addTarget(self, action: #selector(clickCalender), for: .touchUpInside)
    view.addSubview(calenderBtn)
    
    let reminderBtn = UIButton(type: .custom)
    reminderBtn.frame = CGRect(x: 50, y: 150, width: 100, height: 50)
    reminderBtn.setTitle("Reminder", for: .normal)
    reminderBtn.setTitleColor(.red, for: .normal)
    reminderBtn.addTarget(self, action: #selector(clickReminder), for: .touchUpInside)
    view.addSubview(reminderBtn)
  }
  
  @objc private func clickCalender() {
    self.present(MOCalenderViewController(), animated: true, completion: nil)
  }
  
  @objc func clickReminder() {
    self.present(MOReminderViewController(), animated: true, completion: nil)
  }
}

