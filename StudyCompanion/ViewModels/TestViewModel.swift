//
//  TestViewModel.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 27.03.2025.
//

import SwiftUI

final class TestViewModel: ObservableObject {
    @Published var questions: [TestQuestion] = []
    @Published var currentIndex: Int = 0
    @Published var selectedAnswer: String? = nil
    @Published var isAnswerSubmitted = false
    @Published var correctCount = 0
    @Published var showResult = false
    @StateObject private var viewModel: TestViewModel
    let topic: Topic
    
    init(topic: Topic) {
        _viewModel = StateObject(wrappedValue: TestViewModel(topic: topic))
        self.topic = topic
    }

    var currentQuestion: TestQuestion? {
        guard questions.indices.contains(currentIndex) else { return nil }
        return questions[currentIndex]
    }

    func loadQuestions(for topic: Topic) {
        switch topic.title {
        case "Алгебра":
            questions = [
                TestQuestion(
                    question: "Формула дискриминанта?",
                    options: ["D = a² + b²", "D = b² - 4ac", "D = a² - 4ac"],
                    correctAnswer: "D = b² - 4ac"
                ),
                TestQuestion(
                    question: "Корни квадратного уравнения находятся по формуле:",
                    options: ["x = (-b ± √D) / 2a", "x = a² + b", "x = b - √a"],
                    correctAnswer: "x = (-b ± √D) / 2a"
                )
            ]
        default:
            questions = [
                TestQuestion(
                    question: "Что такое тест?",
                    options: ["Вопрос", "Ответ", "Вариант"],
                    correctAnswer: "Вопрос"
                )
            ]
        }
    }

    func submitAnswer() {
        guard let selected = selectedAnswer else { return }

        if selected == currentQuestion?.correctAnswer {
            correctCount += 1
        }

        nextQuestion()
    }


    private func nextQuestion() {
        isAnswerSubmitted = false
        selectedAnswer = nil
        if currentIndex + 1 < questions.count {
            currentIndex += 1
        } else {
            ProgressStorage.shared.updateTestProgress(for: topic, correct: correctCount, total: questions.count)
            showResult = true
        }
    }

    func restartTest() {
        currentIndex = 0
        correctCount = 0
        selectedAnswer = nil
        isAnswerSubmitted = false
        showResult = false
    }
    
    
}
