//
//  TopicCardView.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 27.03.2025.
//

import SwiftUI

struct TopicCardView: View {
    let topic: Topic
    var progress: ProgressData {
        ProgressStorage.shared.progress(for: topic)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(topic.title)
                .font(.headline)

            Text(topic.description)
                .font(.subheadline)
                .foregroundColor(.secondary)

            ProgressView(value: Float(progress.percentage), total: 100)
                .accentColor(.green)
                .animation(.easeInOut(duration: 0.5), value: progress.percentage)

            Text("Прогресс: \(progress.percentage)%")
                .font(.caption)
                .foregroundColor(.gray)
                .animation(.easeInOut, value: progress.percentage)

        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.orange.opacity(0.1))
        .cornerRadius(15)
        .shadow(radius: 2)
    }
}
