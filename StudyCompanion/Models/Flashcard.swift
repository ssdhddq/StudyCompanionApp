//
//  Flashcard.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 27.03.2025.
//

import Foundation

struct Flashcard: Identifiable {
    let id = UUID()
    let question: String
    let answer: String
}

