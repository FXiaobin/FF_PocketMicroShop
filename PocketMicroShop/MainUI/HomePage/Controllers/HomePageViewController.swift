//
//  HomePageViewController.swift
//  PocketMicroShop
//
//  Created by lovepinyao on 16/12/19.
//  Copyright © 2016年 lovepinyao. All rights reserved.
//

import UIKit
import SDCycleScrollView
import MJRefresh

class HomePageViewController: BaseViewController , UITableViewDelegate, UITableViewDataSource, SDCycleScrollViewDelegate{

    let headerViewHeight = 200.0
    var tableView: UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createTableView()
        
       
     
    }
    
    func createTableView() {
        tableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-64.0-49.0), style: .grouped)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.tableFooterView = UIView()
        tableView?.backgroundColor = BG_Color
        tableView?.separatorStyle = .none
        
        tableView?.estimatedRowHeight = 100.0
        tableView?.rowHeight = UITableViewAutomaticDimension
        
        tableView?.register(UINib.init(nibName: "TopHomeCell", bundle: nil), forCellReuseIdentifier: "TopHomeCell")
        
        view.addSubview(tableView!)
        
        
        let header = MJRefreshNormalHeader {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                self.tableView?.mj_header.endRefreshing()
            })
        };
        header?.lastUpdatedTimeLabel.isHidden = true
        tableView?.mj_header = header
        
        let footer = MJRefreshBackNormalFooter {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                self.tableView?.mj_footer.endRefreshing()
            })
        }
        tableView?.mj_footer = footer
        
        let cycleScrollView = SDCycleScrollView(frame: CGRect.init(x: 0.0, y: 0.0, width: Double(kScreenWidth), height: headerViewHeight), delegate: self, placeholderImage: UIImage.init(named: "shadow_asset_black"))
        cycleScrollView?.pageDotColor = UIColor.white
        cycleScrollView?.currentPageDotColor = Main_Color
        cycleScrollView?.pageControlAliment = .init(2)
        cycleScrollView?.bannerImageViewContentMode = .scaleAspectFill
        cycleScrollView?.imageURLStringsGroup = [
            "http://img01.sogoucdn.com/app/a/100520024/85eab7cc1811ea57c2a886efbcc9af3c",
            "http://img01.sogoucdn.com/app/a/100520024/5822b774913cf132ddcdb32641cf0c89",
            "http://c.hiphotos.baidu.com/image/h%3D360/sign=ee04d4cee4cd7b89f66c3c853f244291/1e30e924b899a901760b8f321f950a7b0208f5fc.jpg"]
        
        
        tableView?.tableHeaderView = cycleScrollView
    }
    
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        DDLog(message: "---- index = \(index) ---")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: TopHomeCell = tableView.dequeueReusableCell(withIdentifier: "TopHomeCell", for: indexPath) as! TopHomeCell
        cell.selectionStyle = .none
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 50.0))
        
        let bottomView = UIView(frame: CGRect(x: 0, y: 10, width: kScreenWidth, height: 40.0))
        bottomView.backgroundColor = UIColor.white
        headerView.addSubview(bottomView)
        
        let titleLabel = UILabel(frame: CGRect(x: 15.0, y: 0, width: kScreenWidth-30.0, height: 40.0))
        titleLabel.text = "新品推荐"
        bottomView.addSubview(titleLabel)
        
        let lineView = UIView(frame: CGRect(x: 0, y: 49.5, width: kScreenWidth, height: 0.5))
        lineView.backgroundColor = Seperator_Color
        headerView.addSubview(lineView)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = GoodsDetailViewController()
        detailVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailVC, animated: true)
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
