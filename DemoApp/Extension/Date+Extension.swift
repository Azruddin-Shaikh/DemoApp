//
//  Date+Extension.swift
//  DemoApp
//
//  Created by Azruddin Shaikh on 03/12/24.
//

import Foundation

extension Date {
    var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }
    var minute: Int {
        return Calendar.current.component(.minute, from: self)
    }
    var second: Int {
        return Calendar.current.component(.second, from: self)
    }
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
}
