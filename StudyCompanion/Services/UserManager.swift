//
//  UserManager.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 28.03.2025.
//

import Foundation
import FirebaseAuth

final class UserManager: ObservableObject {
    @Published var displayName: String?
    @Published var email: String?
    @Published var photoURL: URL?

    @Published var isLoggedIn: Bool = false

    init() {
        fetchUser()
    }

    func fetchUser() {
        if let user = Auth.auth().currentUser {
            displayName = user.displayName
            email = user.email
            photoURL = user.photoURL
            isLoggedIn = true
        } else {
            isLoggedIn = false
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            isLoggedIn = false
            displayName = nil
            email = nil
            photoURL = nil
        } catch {
            print("❌ Ошибка при выходе: \(error.localizedDescription)")
        }
    }
}
