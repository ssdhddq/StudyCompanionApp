//
//  GoogleSignInView.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 28.03.2025.
//

import SwiftUI
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift
import FirebaseCore

struct GoogleSignInView: View {
    var body: some View {
        GoogleSignInButton {
            signIn()
        }
        .padding()
    }

    private func signIn() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootVC = windowScene.windows.first?.rootViewController else {
            return
        }

        GIDSignIn.sharedInstance.signIn(withPresenting: rootVC) { result, error in
            if let error = error {
                print(" Ошибка входа: \(error.localizedDescription)")
                return
            }

            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString else {
                print(" Нет токена")
                return
            }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)

            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print(" Firebase ошибка: \(error.localizedDescription)")
                } else {
                    print(" Успешный вход как \(authResult?.user.displayName ?? "без имени")")
                }
            }
        }
    }
}
