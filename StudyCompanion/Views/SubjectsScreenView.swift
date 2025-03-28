//
//  SubjectsScreenView.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 28.03.2025.
//

import SwiftUI

struct SubjectsScreen: View {
    @StateObject private var viewModel = SubjectsViewModel()

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.subjects) { subject in
                        NavigationLink(destination: TopicsScreen(subject: subject)) {
                            SubjectCardView(subject: subject)
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 20)
            }

            
            NavigationLink(destination: StatisticsScreen()) {
                Label("Посмотреть статистику", systemImage: "chart.bar")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .navigationTitle("Предметы")
    }
}
