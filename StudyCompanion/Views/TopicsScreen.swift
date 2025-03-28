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
                    TopicItemView(subject: subject, topic: topic)
                }

            }
            .padding()
        }
        .navigationTitle(subject.title)
    }
}
