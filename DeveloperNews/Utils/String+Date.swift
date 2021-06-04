//
//  String+Date.swift
//  DeveloperNews
//
//  Created by Kevin Menéndez on 4/6/21.
//

import Foundation

extension String {
    func convertToDate(withFormat format: String = "MMM dd, yyyy") -> Date {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "MMM dd, yyyy"
        guard let date = dateFormatterGet.date(from: self) else {
            return Date()
        }
        
        return date
    }
}
