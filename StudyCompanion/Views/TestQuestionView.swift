//
//  TestQuestionView.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 27.03.2025.
//

import SwiftUI

struct TestQuestionView: View {
    let question: TestQuestion
    @Binding var selectedAnswer: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(question.question)
                .font(.headline)

            ForEach(question.options, id: \.self) { option in
                Button(action: {
                    selectedAnswer = option
                }) {
                    HStack {
                        Image(systemName: selectedAnswer == option ? "circle.inset.filled" : "circle")
                        Text(option)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }
                .foregroundColor(.primary)
            }
        }
    }
}
