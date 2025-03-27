//
//  StatisticsScreen.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 27.03.2025.
//

import SwiftUI

struct StatisticsScreen: View {
    @State private var allSubjects: [Subject] = SubjectsViewModel().subjects
    @State private var allTopics: [Topic] = []

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(allSubjects) { subject in
                    Section(header: Text(subject.title).font(.title2).padding(.top)) {
                        let topics = loadTopics(for: subject)
                        ForEach(topics) { topic in
                            let progress = ProgressStorage.shared.progress(for: topic)
                            VStack(alignment: .leading, spacing: 8) {
                                Text(topic.title)
                                    .font(.headline)
                                ProgressView(value: Float(progress.percentage), total: 100)
                                    .accentColor(colorFor(progress.percentage))
                                Text("\(progress.knownCards) из \(progress.totalCards) карточек выучено (\(progress.percentage)%)")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(12)
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Статистика")
    }

    private func loadTopics(for subject: Subject) -> [Topic] {
        switch subject.title {
        case "Математика":
            return [
                Topic(title: "Алгебра", description: ""),
                Topic(title: "Геометрия", description: "")
            ]
        case "Информатика":
            return [
                Topic(title: "Алгоритмы", description: ""),
                Topic(title: "Базы данных", description: "")
            ]
        default:
            return [
                Topic(title: "Общая тема", description: "")
            ]
        }
    }

    private func colorFor(_ percentage: Int) -> Color {
        switch percentage {
        case 0..<30: return .red
        case 30..<70: return .orange
        default: return .green
        }
    }
}
