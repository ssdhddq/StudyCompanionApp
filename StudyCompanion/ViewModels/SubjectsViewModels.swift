//
//  SubjectsViewModels.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 25.02.2025.
//

import Foundation

final class SubjectsViewModel: ObservableObject {
    @Published var subjects: [Subject] = [
        Subject(title: "Математика", imageName: "function"),
        Subject(title: "Информатика", imageName: "desktopcomputer"),
        Subject(title: "Физика", imageName: "atom"),
        Subject(title: "Химия", imageName: "flask"),
        Subject(title: "История", imageName: "book.closed"),
    ]
}
