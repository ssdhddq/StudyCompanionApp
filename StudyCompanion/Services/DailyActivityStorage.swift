//
//  DailyActivityStorage.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 27.03.2025.
//

import Foundation

final class DailyActivityStorage {
    static let shared = DailyActivityStorage()

    private let key = "DailyActivityStorage"
    private var data: [String: DailyActivity] = [:]

    private init() {
        load()
    }

    func recordActivity() {
        let today = Self.format(Date())
        var entry = data[today] ?? DailyActivity(dateString: today, activityCount: 0)
        entry.activityCount += 1
        data[today] = entry
        save()
    }

    func activityForLastNDays(_ n: Int) -> [DailyActivity] {
        let calendar = Calendar.current
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        return (0..<n).map { offset in
            let date = calendar.date(byAdding: .day, value: -offset, to: now)!
            let key = formatter.string(from: date)
            return data[key] ?? DailyActivity(dateString: key, activityCount: 0)
        }.reversed()
    }

    private func save() {
        if let encoded = try? JSONEncoder().encode(data) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }

    private func load() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([String: DailyActivity].self, from: data) {
            self.data = decoded
        }
    }

    private static func format(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
}
