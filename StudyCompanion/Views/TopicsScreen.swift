//
//  TopicsScreen.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 27.03.2025.
//

import SwiftUI

struct TopicsScreen: View {
    let subject: Subject
    @StateObject private var viewModel: TopicsViewModel

    init(subject: Subject) {
        _viewModel = StateObject(wrappedValue: TopicsViewModel(subject: subject))
        self.subject = subject
    }

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(viewModel.topics) { topic in
                    VStack(alignment: .leading, spacing: 12) {
                        TopicCardView(topic: topic)

                        HStack {
                            NavigationLink(destination: FlashcardsScreen(topic: topic)) {
                                Label("Карточки", systemImage: "rectangle.stack")
                            }
                            .buttonStyle(.bordered)

                            NavigationLink(destination: TestScreen(topic: topic)) {
                                Label("Тест", systemImage: "checkmark.circle")
                            }
                            .buttonStyle(.borderedProminent)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(radius: 3)
                }
            }
            .padding()
        }
        .navigationTitle(subject.title)
    }
}
