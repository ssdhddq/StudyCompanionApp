//
//  TestViewModel.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 27.03.2025.
//

import Foundation

final class TestViewModel: ObservableObject {
    @Published var questions: [TestQuestion] = []
    @Published var currentIndex: Int = 0
    @Published var selectedAnswer: String? = nil
    @Published var isAnswerSubmitted = false
    @Published var correctCount = 0
    @Published var showResult = false

    let subject: Subject
    let topic: Topic

    init(subject: Subject, topic: Topic) {
        self.subject = subject
        self.topic = topic

        FirebaseLoader.shared.loadTestQuestions(subject: subject.title, topic: topic.title) { loadedQuestions in
            DispatchQueue.main.async {
                self.questions = loadedQuestions
            }
        }
    }

    var currentQuestion: TestQuestion? {
        guard questions.indices.contains(currentIndex) else { return nil }
        return questions[currentIndex]
    }

    func submitAnswer() {
        guard let selected = selectedAnswer else { return }

        if selected == currentQuestion?.correctAnswer {
            correctCount += 1
        }

        nextQuestion()
    }

    private func nextQuestion() {
        selectedAnswer = nil
        isAnswerSubmitted = false

        if currentIndex + 1 < questions.count {
            currentIndex += 1
        } else {
            showResult = true
            ProgressStorage.shared.updateTestProgress(
                for: topic,
                correct: correctCount,
                total: questions.count
            )
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

