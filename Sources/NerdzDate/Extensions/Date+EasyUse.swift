//
//  Date+EasyUse.swift
//  NerdzUtils
//
//  Created by new user on 12.09.2020.
//

import Foundation

public extension Date {
    static var now: Date {
        Date()
    }

    var allComponents: DateComponents {
        Calendar.current.dateComponents(Set(Calendar.Component.allComponents), from: self)
    }
    
    subscript(_ component: Calendar.Component) -> Int? {
        get {
            Calendar.current.component(component, from: self)
        }
    }
    
    func isInSameDay(as date: Date) -> Bool {
        Calendar.current.isDate(date, inSameDayAs: self)
    }
    
    func adding(_ range: DateRange) -> Date {        
        return Calendar.current.date(byAdding: range.component, value: range.value, to: self) ?? self
    }
    
    func start(of component: Calendar.Component) -> Date {
        var components = allComponents
        
        for innerComponent in component.includedComponents {
            components[innerComponent] = 0
        }
        
        var result = Calendar.current.date(from: components) ?? self
        
        // Strange fix for weeks
        if let weekday = self[.weekday], component == .weekOfMonth || component == .weekOfYear {
            result = result.adding(.day(-weekday + 1))
        }
        
        return result
    }

    func end(of component: Calendar.Component) -> Date {
        start(of: component)
            .adding(DateRange(component: component, value: 1))
            .adding(.second(-1))
    }
    
    static func + (lhs: Self, rhs: DateRange) -> Self {
        lhs.adding(rhs)
    }
}
