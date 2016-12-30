//
//  UIImage.swift
//  PocketMicroShop
//
//  Created by lovepinyao on 16/12/20.
//  Copyright © 2016年 lovepinyao. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    func imageWithColor(color: UIColor) -> UIImage {
        
        let rect = CGRect.init(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size);
        let context = UIGraphicsGetCurrentContext();
        
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        
        return image;
    }
    
    
    
    
    
    
    
    
    
    
    
}


