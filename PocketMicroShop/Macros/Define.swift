//
//  Define.swift
//  PocketMicroShop
//
//  Created by lovepinyao on 16/12/19.
//  Copyright © 2016年 lovepinyao. All rights reserved.
//

import Foundation
import UIKit




///打印信息
func DDLog<T>(message: T, file: String = #file, method: String = #function, line: Int = #line){
    #if DEBUG
        print("\((file as NSString).lastPathComponent): \(method)->[第\(line)行]: \(message)")
    #endif
}


let kStatusBarHeight = 20.0
let kNavigationBarHeight = 64.0
let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenRate = UIScreen.main.bounds.size.width / 375.0


let kUserDefaults = UserDefaults.standard
let kNotificationCenter = NotificationCenter.default


///字体
let Main_Font = UIFont.init(name: "PingFang SC", size: 18.0)!


///颜色
func RandomColor() -> UIColor {
    let  rvalue = CGFloat(arc4random_uniform(255))/256.0
    let  gvalue = CGFloat(arc4random_uniform(255))/256.0
    let  bvalue = CGFloat(arc4random_uniform(255))/256.0
    return UIColor(red: rvalue, green: gvalue, blue: bvalue, alpha: 1.0)
}

func RGBCOLOR(_ r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor{
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}

let BG_Color = UIColor(hexColor: "f2f2f5")
let Time_Color = UIColor(hexColor: "999999")
let Main_Color = UIColor(hexColor: "ff9600")
let Title_Color = UIColor(hexColor: "333333")
let Content_Color = UIColor(hexColor: "666666")
let Seperator_Color = UIColor(hexColor: "e5e5e5")


///图片设置
func ImageWithName(_ imageName:String) -> UIImage{
    return UIImage(named: imageName)!
}

///以秒为单位的时间戳
let currentDateTimeInterval: TimeInterval = NSDate().timeIntervalSince1970

///角度转弧度
func DEGREES_TO_RADIANS(angle: Double) -> Double{
    return angle * M_PI / 180.0
}


/*  系统  */

//判断是否为iPhone
let IS_IPHONE = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone)
//判断是否为iPad
let IS_IPAD = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad)
//判断是否为ipod
let IS_IPOD = (UIDevice.current.model == "iPod touch")
// 判断是否为 iPhone 5SE
let is_iPhone5SE = (UIScreen.main.bounds.width == 320.0 && UIScreen.main.bounds.height == 568.0)
// 判断是否为iPhone 6/6s
let is_iPhone6Or6s = (UIScreen.main.bounds.width == 375.0 && UIScreen.main.bounds.height == 667.0)
// 判断是否为iPhone 6Plus/6sPlus
let is_iPhone6PlusOr6sPlus = (UIScreen.main.bounds.width == 414.0 && UIScreen.main.bounds.height == 736.0)
//获取系统版本
let IOS_SYSTEM_VERSION = Float(UIDevice.current.systemVersion)!
//判断 iOS 8 或更高的系统版本
let IS_IOS_VERSION_8_OR_LATER = ((IOS_SYSTEM_VERSION >= 8.0) ? (true):(false))
//屏幕分辨率
let SCREEN_RESOLUTION = kScreenWidth * kScreenHeight * (UIScreen.main.scale)




///判断是真机还是模拟器
#if TARGET_OS_IPHONE
    //iPhone Device
#endif
#if TARGET_IPHONE_SIMULATOR
    //iPhone Simulator
#endif







