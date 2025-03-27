//
//  Topic.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 27.03.2025.
//

import Foundation

struct Topic: Identifiable, Hashable {
    var id: String { title }
    let title: String
    let description: String
}

