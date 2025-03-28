//
//  TopicCardView.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 27.03.2025.
//

import SwiftUI

struct TopicCardView: View {
    let topic: Topic
    @State private var progress: ProgressData = ProgressData(knownCards: 0, totalCards: 0, correctTestAnswers: 0, totalTestQuestions: 0)

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(topic.title)
                .font(.headline)

            ProgressView(value: Float(progress.percentage), total: 100)
                .accentColor(.green)
            Text("Прогресс: \(progress.percentage)%")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.orange.opacity(0.1))
        .cornerRadius(12)
        .onAppear {
            progress = ProgressStorage.shared.progress(for: topic)
        }
    }
}
