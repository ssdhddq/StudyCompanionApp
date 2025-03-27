//
//  TopicViewModel.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 27.03.2025.
//

import Foundation

final class TopicsViewModel: ObservableObject {
    @Published var topics: [Topic] = []

    func loadTopics(for subject: Subject) {
        switch subject.title {
        case "Математика":
            topics = [
                Topic(title: "Алгебра", description: "Формулы, уравнения, функции"),
                Topic(title: "Геометрия", description: "Фигуры, теоремы, доказательства")
            ]
        case "Информатика":
            topics = [
                Topic(title: "Алгоритмы", description: "Сортировки, графы, рекурсия"),
                Topic(title: "Базы данных", description: "SQL, нормализация")
            ]
        default:
            topics = [
                Topic(title: "Общая тема", description: "Описание темы")
            ]
        }
    }
}
