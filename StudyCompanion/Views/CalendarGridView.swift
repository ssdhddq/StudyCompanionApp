//
//  CalendarGridView.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 27.03.2025.
//

import SwiftUI

struct CalendarGridView: View {
    let days: [DailyActivity]
    let columns = Array(repeating: GridItem(.fixed(16), spacing: 4), count: 7)

    var body: some View {
        LazyVGrid(columns: columns, spacing: 4) {
            ForEach(days) { day in
                Rectangle()
                    .frame(width: 16, height: 16)
                    .cornerRadius(4)
                    .foregroundColor(color(for: day.activityCount))
            }
        }
    }

    func color(for count: Int) -> Color {
        switch count {
        case 0: return Color.gray.opacity(0.2)
        case 1: return Color.green.opacity(0.4)
        case 2...3: return Color.green.opacity(0.6)
        case 4...5: return Color.green.opacity(0.8)
        default: return Color.green
        }
    }
}
