//
//  ProgressData.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 27.03.2025.
//

import Foundation

struct ProgressData: Codable {
    var knownCards: Int
    var totalCards: Int
    var correctTestAnswers: Int
    var totalTestQuestions: Int

    var percentage: Int {
        guard totalCards > 0 else { return 0 }
        return Int((Double(knownCards) / Double(totalCards)) * 100)
    }

    var testScorePercent: Int {
        guard totalTestQuestions > 0 else { return 0 }
        return Int((Double(correctTestAnswers) / Double(totalTestQuestions)) * 100)
    }
}

