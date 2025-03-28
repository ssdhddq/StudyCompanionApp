//
//  FlashcardScreen.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 27.03.2025.
//

import SwiftUI

struct FlashcardsScreen: View {
    let subject: Subject
    let topic: Topic
    @StateObject private var viewModel: FlashcardsViewModel

    init(subject: Subject, topic: Topic) {
        self.subject = subject
        self.topic = topic
        _viewModel = StateObject(wrappedValue: FlashcardsViewModel(subject: subject, topic: topic))
    }

    var body: some View {
        VStack(spacing: 24) {
            if let card = viewModel.currentCard {
                FlashcardView(flashcard: card, showAnswer: viewModel.showAnswer)

                Button(viewModel.showAnswer ? "Следующая карточка" : "Показать ответ") {
                    if viewModel.showAnswer {
                        viewModel.nextCard()
                    } else {
                        viewModel.showAnswer = true
                    }
                }
                .buttonStyle(.borderedProminent)

                if viewModel.showAnswer {
                    HStack {
                        Button("Не знаю") {
                            viewModel.markCardAsKnown(false)
                        }
                        .buttonStyle(.bordered)

                        Button("Знаю") {
                            viewModel.markCardAsKnown(true)
                        }
                        .buttonStyle(.bordered)
                    }
                }
            } else {
                Text("Нет карточек")
            }
        }
        .padding()
        .navigationTitle(topic.title)
    }
}
