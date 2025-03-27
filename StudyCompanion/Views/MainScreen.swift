//
//  MainScreen.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 25.02.2025.
//

import SwiftUI

struct MainScreen: View {
    @StateObject private var viewModel = SubjectsViewModel()

    var body: some View {
        NavigationStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(viewModel.subjects) { subject in
                        NavigationLink {
                            Text("Темы по предмету: \(subject.title)")
                        } label: {
                            SubjectCardView(subject: subject)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Выберите предмет")
        }
    }
}
