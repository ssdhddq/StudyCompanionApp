//
//  TopicsScreen.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 27.03.2025.
//

import SwiftUI

struct TopicsScreen: View {
    let subject: Subject
    @StateObject private var viewModel = TopicsViewModel()

    var body: some View {
        List(viewModel.topics) { topic in
            NavigationLink {
                Text("Карточки по теме: \(topic.title)") 
            } label: {
                TopicCardView(topic: topic)
            }
            .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
        .navigationTitle(subject.title)
        .onAppear {
            viewModel.loadTopics(for: subject)
        }
    }
}
