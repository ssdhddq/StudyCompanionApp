//
//  TopicItemView.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 28.03.2025.
//

import SwiftUI

struct TopicItemView: View {
    let subject: Subject
    let topic: Topic

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            TopicCardView(topic: topic)

            HStack {
                NavigationLink(destination: FlashcardsScreen(subject: subject, topic: topic)) {
                    Label("Карточки", systemImage: "rectangle.stack")
                }
                .buttonStyle(.bordered)

                NavigationLink(destination: TestScreen(subject: subject, topic: topic)) {
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
