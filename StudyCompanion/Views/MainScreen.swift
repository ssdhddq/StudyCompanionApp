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
            GoogleSignInView()

            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(viewModel.subjects) { subject in
                            NavigationLink {
                                TopicsScreen(subject: subject)
                            } label: {
                                SubjectCardView(subject: subject)
                            }
                        }
                    }
                    .padding()
                }

                NavigationLink(destination: StatisticsScreen()) {
                    Label("Посмотреть статистику", systemImage: "chart.bar")
                }
                .padding()
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Выберите предмет")
        }
    }
}
