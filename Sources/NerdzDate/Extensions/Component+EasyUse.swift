//
//  Component+EasyUse.swift
//  NerdzDate
//
//  Created by new user on 07.10.2020.
//

import Foundation

public extension Calendar.Component {
    
    static var allComponents: [Calendar.Component] {
        [
            nanosecond, 
            second, 
            minute,
            hour,
            day, 
            month, 
            year, 
            era, 
            weekday, 
            quarter, 
            weekOfMonth, 
            weekOfYear, 
            timeZone, 
            yearForWeekOfYear,
            timeZone,
            calendar
        ]
    }
    
    var allComponents: [Calendar.Component] {
        includedComponents + [self]
    }
    
    var includedComponents: [Calendar.Component] {
        switch self {
        case .era:
            return Calendar.Component.year.allComponents
            
        case .year, .yearForWeekOfYear:
            return Calendar.Component.month.allComponents
            
        case .quarter:
            return Calendar.Component.month.allComponents
            
        case .month:
            return Calendar.Component.day.allComponents
            
        case .weekOfYear, .weekOfMonth:
            return Calendar.Component.weekday.allComponents
            
        case .day, .weekday, .weekdayOrdinal:
            return Calendar.Component.hour.allComponents
            
        case .hour:
            return Calendar.Component.minute.allComponents
            
        case .minute:
            return Calendar.Component.second.allComponents
            
        case .second:
            return Calendar.Component.nanosecond.allComponents
            
        case .nanosecond:
            return []
            
        case .calendar, .timeZone:
            return []
            
        @unknown default:
            return []
        }
    }
}
