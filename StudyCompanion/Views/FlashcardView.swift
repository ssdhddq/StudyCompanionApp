//
//  FlashcardView.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 27.03.2025.
//

import SwiftUI

struct FlashcardView: View {
    let flashcard: Flashcard
    let showAnswer: Bool

    var body: some View {
        VStack(spacing: 16) {
            Text(flashcard.question)
                .font(.title2)
                .bold()
            if showAnswer {
                Divider()
                Text(flashcard.answer)
                    .font(.body)
                    .foregroundColor(.green)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 250)
        .background(Color.yellow.opacity(0.1))
        .cornerRadius(20)
        .shadow(radius: 5)
        .animation(.easeInOut, value: showAnswer)
    }
}
