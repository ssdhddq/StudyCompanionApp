//
//  FirebaseLoader.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 28.03.2025.
//

import FirebaseCore
import FirebaseFirestore
import Foundation


final class FirebaseLoader {
    static let shared = FirebaseLoader()
    private let db = Firestore.firestore()

    func loadFlashcards(subject: String, topic: String, completion: @escaping ([Flashcard]) -> Void) {
        db.collection("subjects")
            .document(subject)
            .collection("topics")
            .document(topic)
            .collection("flashcards")
            .getDocuments { snapshot, error in
                if let error = error {
                    print("🔥 Ошибка загрузки: \(error.localizedDescription)")
                }

                guard let docs = snapshot?.documents else {
                    completion([])
                    return
                }

                let cards = docs.compactMap { doc -> Flashcard? in
                    let data = doc.data()
                    guard let q = data["question"] as? String,
                          let a = data["answer"] as? String else { return nil }
                    return Flashcard(question: q, answer: a)
                }

                print("✅ Firebase вернул \(cards.count) карточек")
                completion(cards)
            }
    }


    func loadTestQuestions(subject: String, topic: String, completion: @escaping ([TestQuestion]) -> Void) {
        db.collection("subjects")
            .document(subject)
            .collection("topics")
            .document(topic)
            .collection("testQuestions")
            .getDocuments { snapshot, error in
                if let docs = snapshot?.documents {
                    let questions = docs.compactMap { doc -> TestQuestion? in
                        let data = doc.data()
                        guard let q = data["question"] as? String,
                              let options = data["options"] as? [String],
                              let correct = data["correctAnswer"] as? String else { return nil }
                        return TestQuestion(question: q, options: options, correctAnswer: correct)
                    }
                    completion(questions)
                } else {
                    completion([])
                }
            }
    }
}
