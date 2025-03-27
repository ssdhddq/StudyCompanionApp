//
//  TestScreen.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 27.03.2025.
//

import SwiftUI

struct TestScreen: View {
    let topic: Topic
    @StateObject private var viewModel = TestViewModel()

    var body: some View {
        VStack {
            if viewModel.showResult {
                VStack(spacing: 16) {
                    Text("Тест завершён!")
                        .font(.title2)
                    Text("Правильных ответов: \(viewModel.correctCount) из \(viewModel.questions.count)")
                        .font(.headline)
                    Button("Пройти снова") {
                        viewModel.restartTest()
                    }
                    .buttonStyle(.borderedProminent)
                }
            } else if let question = viewModel.currentQuestion {
                TestQuestionView(question: question, selectedAnswer: $viewModel.selectedAnswer)

                Button("Ответить") {
                    viewModel.submitAnswer()
                }
                .disabled(viewModel.selectedAnswer == nil)
                .buttonStyle(.borderedProminent)
                .padding(.top, 24)
            } else {
                Text("Загрузка...")
            }
        }
        .padding()
        .navigationTitle("Тест: \(topic.title)")
        .onAppear {
            viewModel.loadQuestions(for: topic)
        }
    }
}
