//
//  PersonHeaderView.swift
//  PocketMicroShop
//
//  Created by lovepinyao on 16/12/21.
//  Copyright © 2016年 lovepinyao. All rights reserved.
//

import UIKit

class PersonHeaderView: UIView {

    
    @IBOutlet weak var headerBtn: UIButton!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var introLabel: UILabel!
    
    var chooseHeaderBtnActionBlock = {(sender: UIButton) -> () in
        
    }
    
    
    
    @IBAction func chooseHeaderBtnAction(_ sender: UIButton) {
        chooseHeaderBtnActionBlock(sender)
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
