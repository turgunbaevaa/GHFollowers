//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Aruuke Turgunbaeva on 27/3/24.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
