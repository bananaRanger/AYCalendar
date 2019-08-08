//
//  ViewController.swift
//  AYCalendar
//
//  Created by antonyereshchenko@gmail.com on 08/08/2019.
//  Copyright (c) 2019 antonyereshchenko@gmail.com. All rights reserved.
//

import UIKit
import AYCalendar

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()


  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    let vc = AYCalendarViewController()
    vc.delegate = self
    vc.uiDelegate = self
    vc.dataSource = self
    
    vc.calendarSlides.backgroundColor = .white
    
//    vc.monthNavigationView?.backgroundColor = .darkText
//    vc.monthNavigationView?.lblText.textColor = .white
//    vc.monthNavigationView?.btnPrev.backgroundColor = .white
//    vc.monthNavigationView?.btnNext.backgroundColor = .white

//    vc.monthNavigationView?.layer.shadowColor = UIColor.white.cgColor
//    vc.monthNavigationView?.layer.cornerRadius = 8
//    vc.monthNavigationView?.layer.shadowRadius = 10
//    vc.monthNavigationView?.layer.shadowOpacity = 0.1
//
//    vc.calendarSlides.layer.shadowColor = UIColor.white.cgColor
//    vc.calendarSlides.layer.cornerRadius = 8
//    vc.calendarSlides.layer.shadowRadius = 10
//    vc.calendarSlides.layer.shadowOpacity = 0.25
//
    present(vc, animated: true, completion: nil)
  }
  
  var cellBack = UIColor(red: 242.0/255.0, green: 163.0/255.0, blue: 181.0/255.0, alpha: 1.0)
  var cellText = UIColor(red: 237.0/255.0, green: 107.0/255.0, blue: 134.0/255.0, alpha: 1.0)
  var cellBadge = UIColor.white
  
  /*
   back:  UIColor(red: 242.0/255.0, green: 163.0/255.0, blue: 181.0/255.0, alpha: 1.0)
   text:  UIColor(red: 237.0/255.0, green: 107.0/255.0, blue: 134.0/255.0, alpha: 1.0)
   badge: .white
   */
  
  /*
   back:  UIColor(red: 170.0/255.0, green: 220.0/255.0, blue: 250.0/255.0, alpha: 1.0)
   text:  UIColor(red: 237.0/255.0, green: 107.0/255.0, blue: 134.0/255.0, alpha: 1.0)
   badge: UIColor(red: 133.0/255.0, green: 183.0/255.0, blue: 250.0/255.0, alpha: 1.0)
   */
  
  /*
   back:  UIColor(red: 255.0/255.0, green: 250.0/255.0, blue: 170.0/255.0, alpha: 1.0)
   text:  UIColor(red: 114.0/255.0, green: 178.0/255.0, blue: 250.0/255.0, alpha: 1.0)
   badge: UIColor(red: 240.0/255.0, green: 143.0/255.0, blue: 126.0/255.0, alpha: 1.0)
   */
  
}

extension ViewController: AYCalendarUIDelegate, AYCalendarDelegate, AYCalendarDataSource {
  
//  func monthContentInsets() -> UIEdgeInsets {
//    return UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
//  }
//
//  func padding() -> CGFloat {
//    return 32
//  }
  
//  func selectedDayTextColor() -> UIColor {
//    return cellText
//  }
//
//  func selectedDayBackgorundColor() -> UIColor {
//    return cellBack
//  }
  
//  func badgeBackgorundColor() -> UIColor {
//    return .black
//  }
//  
//  func badgeSelectedBackgorundColor() -> UIColor {
//    return .white
//  }
  
//  func backgorundColor() -> UIColor {
//    return cellBack//.groupTableViewBackground
//  }
  
  func badges() -> [Date] {
    return [Date(timeIntervalSince1970: 1566205810)]
  }
  
  func badgeHeight() -> CGFloat {
    return 5
  }
  
//  func dayFont() -> UIFont {
//    return UIFont.systemFont(ofSize: 16, weight: .black)
//  }
  
  
  
  func calendarDidPresent(with date: Date?) {
    print("!")
  }
  
  func didSelect(date: Date?) {
    print("!!!")
  }
}
