//
//  Date+Extension.swift
//  DISRailWay
//
//  Created by dis on 2017/11/06.
//  Copyright © 2017年 jp.co.disol. All rights reserved.
//

import Foundation

extension Date {
    static func date(with year:Int, _ month:Int, _ day:Int, _ hour:Int, _ minute:Int, _ second:Int) -> Date? {
        let calendar = Calendar(identifier: .gregorian)
        var dateCom = DateComponents()
        dateCom.year = year
        dateCom.month = month
        dateCom.day = day
        dateCom.hour = hour
        dateCom.minute = minute
        dateCom.second = second
        return calendar.date(from: dateCom)
    }
}

