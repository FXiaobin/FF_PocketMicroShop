//
//  AppDelegate.swift
//  PocketMicroShop
//
//  Created by lovepinyao on 16/12/19.
//  Copyright © 2016年 lovepinyao. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window?.backgroundColor = UIColor.white
        UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
        navigationBarApperanceCustom()
        
        
        window?.rootViewController = RootTabBarViewController()
        
        
        return true
    }
    
    func navigationBarApperanceCustom(){
        
        UIWindow.appearance().tintColor = Main_Color
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.gray], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName : Main_Color], for: .selected)
        
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().barTintColor = Main_Color
        
        let image = UIImage().imageWithColor(color: Main_Color)
        
        UINavigationBar.appearance().setBackgroundImage(image, for: .default)
        UINavigationBar.appearance().shadowImage = image
        UINavigationBar.appearance().backgroundColor = Main_Color
        UINavigationBar().backIndicatorImage = UIImage.init(named: "")
        UINavigationBar().backIndicatorTransitionMaskImage = UIImage.init(named: "")
        UINavigationBar().isTranslucent = false
        UINavigationBar().barStyle = .black
        
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName : Main_Font, NSForegroundColorAttributeName : UIColor.white]
        
        
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

