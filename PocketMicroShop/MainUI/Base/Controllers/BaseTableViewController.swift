//
//  BaseTableViewController.swift
//  PocketMicroShop
//
//  Created by lovepinyao on 16/12/19.
//  Copyright © 2016年 lovepinyao. All rights reserved.
//

import UIKit
import MJRefresh

class BaseTableViewController: BaseViewController , UITableViewDelegate, UITableViewDataSource{
    
    var tableView: UITableView?
    var dataArr: NSMutableArray?
    var currentPage = 0
    var isRefreshing = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataArr = NSMutableArray()
        
        createTableView()
        
        
        hiddenFooterRefreshControl()
    }
    
    func queryData() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
          
            self.endTableViewRefresh()
        })
    }
    
    func createTableView() {
        tableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-64.0), style: .grouped)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.tableFooterView = UIView()
        tableView?.backgroundColor = BG_Color
        tableView?.separatorStyle = .none
        
        tableView?.estimatedRowHeight = 44.0
        tableView?.rowHeight = UITableViewAutomaticDimension
        
        tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView!)
        
        ///刷新
        let header = MJRefreshNormalHeader {
            self.currentPage = 0
            self.isRefreshing = true
            self.queryData()
        };
        header?.lastUpdatedTimeLabel.isHidden = true
        tableView?.mj_header = header
        
        let footer = MJRefreshBackNormalFooter {
            self.currentPage += 1
            self.isRefreshing = false
            self.queryData()
        }
        tableView?.mj_footer = footer
    }
   
    ///隐藏刷新控件
    func hiddenRefreshControl(){
        tableView?.mj_header = nil
        tableView?.mj_footer = nil
    }
    
    func hiddenFooterRefreshControl(){
        tableView?.mj_footer = nil
    }
    
    ///结束刷新
    func endTableViewRefresh() {
        
        isRefreshing = false
        if ((tableView?.mj_header) != nil) {
            tableView?.mj_header.endRefreshing()
        }
        if ((tableView?.mj_footer) != nil) {
            tableView?.mj_footer.endRefreshing()
        }
        tableView?.reloadData()
    }
    
    ///tableView Delegate DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataArr?.count)!
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
