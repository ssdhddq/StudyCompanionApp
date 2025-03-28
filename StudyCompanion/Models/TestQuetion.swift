//
//  TestQuetion.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 27.03.2025.
//

import Foundation

struct TestQuestion: Identifiable {
    let id = UUID()
    let question: String
    let options: [String]
    let correctAnswer: String
}
