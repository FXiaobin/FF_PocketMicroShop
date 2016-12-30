//
//  PersonCenterViewController.swift
//  PocketMicroShop
//
//  Created by lovepinyao on 16/12/19.
//  Copyright © 2016年 lovepinyao. All rights reserved.
//

import UIKit
import Masonry


class PersonCenterViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    let headerView_Height: CGFloat  = 260.0
    var naviBarView: PersonNaviBarView?
    var tableView: UITableView?
    var personHeaderView: PersonHeaderView?
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if self.navigationController?.isNavigationBarHidden == false {
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false

        // Do any additional setup after loading the view.
        self.navigationItem.title = ""
        
        
        
        createTableView()
        
        let naviView: PersonNaviBarView = Bundle.main.loadNibNamed("PersonNaviBarView", owner: self, options: nil)?.first as! PersonNaviBarView
        naviView.alpha = 0.0
        naviView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: 64.0)
        naviBarView = naviView
        view.addSubview(naviView)
    }
    
    func createTableView() {
        tableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-49.0), style: .grouped)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.tableFooterView = UIView()
        tableView?.backgroundColor = BG_Color
        //tableView?.separatorStyle = .none
        tableView?.contentInset = UIEdgeInsetsMake(headerView_Height, 0, 0, 0)
        tableView?.contentOffset = CGPoint(x: 0, y: -headerView_Height)
        
        tableView?.estimatedRowHeight = 44.0
        tableView?.rowHeight = UITableViewAutomaticDimension
        
        tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView!)
        
        
        let header: PersonHeaderView = Bundle.main.loadNibNamed("PersonHeaderView", owner: self, options: nil)?.first as! PersonHeaderView
        header.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: headerView_Height)
        personHeaderView = header
        view.addSubview(header)
        
        header.chooseHeaderBtnActionBlock = {(sender: UIButton) -> () in
            print("--- choose header --")
            
        }

    }
    
    ///tableView Delegate DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.selectionStyle = .none
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let shopManagerVC = ShopManagerViewController()
        shopManagerVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(shopManagerVC, animated: true)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offy = scrollView.contentOffset.y
        
        let y = fabsf(Float(offy + headerView_Height))
        //print("--- \(y) ---")
        
        if offy > -headerView_Height {
            let alpha = y / Float(headerView_Height)
            //print("--- \(alpha) ---")
            naviBarView?.alpha = CGFloat(alpha)
            
            var frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: headerView_Height)
            frame.origin.y = -CGFloat(y)
            personHeaderView?.frame = frame
            
        }else{
            naviBarView?.alpha = 0.0
            var frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: headerView_Height)
            frame.size.height = CGFloat(y) + headerView_Height
            personHeaderView?.frame = frame
        }
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
