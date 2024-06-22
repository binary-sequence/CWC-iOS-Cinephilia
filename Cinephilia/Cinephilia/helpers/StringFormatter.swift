//
//  StringFormatter.swift
//  Cinephilia
//
//  Created by Sergio Lindo Mansilla on 22.06.2024.
//

import Foundation

struct StringFormatter {
    static func getFormatted(date: Date) -> String {
        let todayComponents = Calendar.current.dateComponents(Set([.year, .month, .day]), from: date)
        
        return "\(todayComponents.year!)-\(String(format: "%02d", todayComponents.month!))-\(todayComponents.day!)"
    }
}
