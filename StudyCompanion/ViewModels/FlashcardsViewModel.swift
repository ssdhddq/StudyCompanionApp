//
//  FlashcardsViewModel.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 27.03.2025.
//

import Foundation

final class FlashcardsViewModel: ObservableObject {
    @Published var flashcards: [Flashcard] = []
    @Published var currentIndex: Int = 0
    @Published var showAnswer = false

    var currentCard: Flashcard? {
        guard flashcards.indices.contains(currentIndex) else { return nil }
        return flashcards[currentIndex]
    }

    func loadFlashcards(for topic: Topic) {
        // позже заменю загрузкой из Firebase
        switch topic.title {
        case "Алгебра":
            flashcards = [
                Flashcard(question: "Что такое квадратное уравнение?", answer: "Это уравнение вида ax² + bx + c = 0"),
                Flashcard(question: "Формула дискриминанта?", answer: "D = b² - 4ac")
            ]
        case "Алгоритмы":
            flashcards = [
                Flashcard(question: "Что такое бинарный поиск?", answer: "Алгоритм поиска в отсортированном массиве за O(log n)"),
                Flashcard(question: "Пример рекурсии?", answer: "Факториал, Фибоначчи и т.д.")
            ]
        default:
            flashcards = [
                Flashcard(question: "Пример вопроса", answer: "Пример ответа")
            ]
        }
    }

    func markCardAsKnown(_ known: Bool) {
        nextCard()
    }

    func nextCard() {
        showAnswer = false
        if currentIndex + 1 < flashcards.count {
            currentIndex += 1
        } else {
            currentIndex = 0
        }
    }
}
