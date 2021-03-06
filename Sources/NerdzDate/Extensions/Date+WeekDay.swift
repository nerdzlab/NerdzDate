//
//  File.swift
//  
//
//  Created by Mykhailo on 06.04.2021.
//

import Foundation

public extension Date {
    enum Weekday: Int {
        case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
    }
    
    func next(
        _ weekday: Weekday,
        considerToday: Bool = false) -> Date? {
        findWeekDayDate(weekday, direction: .forward, considerToday: considerToday)
    }
    
    func previous(
        _ weekday: Weekday,
        considerToday: Bool = false) -> Date? {
        findWeekDayDate(weekday, direction: .backward, considerToday: considerToday)
    }
    
    private func findWeekDayDate(
        _ weekday: Weekday,
        direction: Calendar.SearchDirection = .forward,
        considerToday: Bool = false
    ) -> Date? {
        
        let calendar = Calendar(identifier: .gregorian)
        let components = DateComponents(weekday: weekday.rawValue)
        
        if considerToday && calendar.component(.weekday, from: self) == weekday.rawValue {
            return self
        }
        
        return calendar.nextDate(
            after: self,
            matching: components,
            matchingPolicy: .nextTime,
            direction: direction
        )
    }
}
