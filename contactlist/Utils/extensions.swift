//
//  extensions.swift
//  contactlist
//
//  Created by Mac mini on 14/01/22.
//

import Foundation

extension Int{
    func toDate()->String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let date = dateFormatter.date(from: String(self))
        return String("\(date!.get(.day))/\(date!.get(.month))")
        
    }
}

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}
