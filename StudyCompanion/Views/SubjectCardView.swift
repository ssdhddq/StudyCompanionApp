//
//  SubjectCardView.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 25.02.2025.
//

import SwiftUI

struct SubjectCardView: View {
    let subject: Subject

    var body: some View {
        VStack {
            Image(systemName: subject.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 50)
                .padding()
            Text(subject.title)
                .font(.headline)
                .padding(.bottom, 8)
        }
        .frame(width: 150, height: 150)
        .background(Color.blue.opacity(0.1))
        .cornerRadius(20)
        .shadow(radius: 4)
    }
}
