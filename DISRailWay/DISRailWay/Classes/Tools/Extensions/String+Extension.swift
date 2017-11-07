//
//  String+Extension.swift
//  DISRailWay
//
//  Created by dis on 2017/10/23.
//  Copyright © 2017年 jp.co.disol. All rights reserved.
//
//

import Foundation

extension String {
    
    func docDir() -> String {
        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!
        return (docPath as NSString).appendingPathComponent((self as NSString).pathComponents.last!)
    }
    
    /// 快速返回一个缓存目录的路径
    func cachesDir() -> String {
        let cachesPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last!
        return (cachesPath as NSString).appendingPathComponent((self as NSString).pathComponents.last!)
    }
    
    /// 快速返回一个临时目录的路径
    func tmpDir() -> String {
        let tmpPath = NSTemporaryDirectory()
        return (tmpPath as NSString).appendingPathComponent((self as NSString).pathComponents.last!)
    }
    
    /// 将时间间隔返回成字符串
    static func stringWithTimeInterval(time: TimeInterval) -> String {
        // 补充系统冗余时间
        let supplementTime = time + 0.05
        let min = NSInteger(supplementTime / 60)
        let second = NSInteger(supplementTime) % 60
        return NSString(format: "%02ld:%02ld", min, second) as String
    }
    
    static func string(with date:Date, using format:String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}
