//
//  RootTabBarViewController.swift
//  PocketMicroShop
//
//  Created by lovepinyao on 16/12/20.
//  Copyright © 2016年 lovepinyao. All rights reserved.
//

import UIKit

class RootTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let homePageVC = HomePageViewController()
        let homeNC = tabBarItemNavigationController(viewController: homePageVC, title: "首页", image: "", selectedImage: "")
        
        
        let goodsManagerVC = GoodsManagerViewController()
        let goodsNC = tabBarItemNavigationController(viewController: goodsManagerVC, title: "商品管理", image: "", selectedImage: "")
        
        let orderManagerVC = OrderManagerViewController()
        let orderNC = tabBarItemNavigationController(viewController: orderManagerVC, title: "订单管理", image: "", selectedImage: "")
        /*
        let shopManagerVC = ShopManagerViewController()
        let shopNC = tabBarItemNavigationController(viewController: shopManagerVC, title: "店铺管理", image: "", selectedImage: "")
        */
        
        let personCenterVC = PersonCenterViewController()
        let personNC = tabBarItemNavigationController(viewController: personCenterVC, title: "我的", image: "", selectedImage: "")
        
        self.viewControllers = [homeNC, goodsNC, orderNC, personNC]
    }
    
    func tabBarItemNavigationController(viewController: BaseViewController, title: String, image: String, selectedImage: String) -> UINavigationController {
        
        let tabBarItem = UITabBarItem(title: title, image: UIImage.init(named: image), selectedImage: UIImage.init(named: selectedImage))
        tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2)
        tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0)
        
        let nc = UINavigationController(rootViewController: viewController)
        nc.tabBarItem = tabBarItem
        
        return nc
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
