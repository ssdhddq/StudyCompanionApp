//
//  ProgressStorage.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 27.03.2025.
//

import Foundation

final class ProgressStorage {
    static let shared = ProgressStorage()

    private let key = "ProgressStorageKey"
    private var storage: [String: ProgressData] = [:]

    private init() {
        load()
    }

    func progress(for topic: Topic) -> ProgressData {
        storage[topic.id] ?? ProgressData(knownCards: 0, totalCards: 0, correctTestAnswers: 0, totalTestQuestions: 0)
    }

    func updateTestProgress(for topic: Topic, correct: Int, total: Int) {
        var progress = storage[topic.id] ?? ProgressData(knownCards: 0, totalCards: 0, correctTestAnswers: 0, totalTestQuestions: 0)
        progress.correctTestAnswers = correct
        progress.totalTestQuestions = total
        storage[topic.id] = progress
        save()
    }
    
    func updateCardProgress(for topic: Topic, known: Int, total: Int) {
        var progress = storage[topic.id] ?? ProgressData(knownCards: 0, totalCards: 0, correctTestAnswers: 0, totalTestQuestions: 0)
        progress.knownCards = known
        progress.totalCards = total
        storage[topic.id] = progress
        save()
    }


    private func save() {
        if let data = try? JSONEncoder().encode(storage) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    private func load() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode([String: ProgressData].self, from: data) {
            storage = decoded
        }
    }
}
