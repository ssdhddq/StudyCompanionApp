//
//  DailyActivity.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 27.03.2025.
//

import Foundation

struct DailyActivity: Codable, Identifiable {
    var id: String { dateString }
    let dateString: String  
    var activityCount: Int

    var date: Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: dateString) ?? Date()
    }
}
