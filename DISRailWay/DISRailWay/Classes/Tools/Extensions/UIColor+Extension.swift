//
//  UIColor+Extension.swift
//  DISRailWay
//
//  Created by dis on 2017/10/26.
//  Copyright © 2017年 jp.co.disol. All rights reserved.
//

import UIKit

extension UIColor {
    class func getRandomColor () -> UIColor {
        return UIColor(red: CGFloat(arc4random_uniform(256)) / 255.0, green: CGFloat(arc4random_uniform(256)) / 255.0, blue: CGFloat(arc4random_uniform(256)) / 255.0, alpha: 1.0)
    }
}
