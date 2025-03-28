//
//  MainScreen.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 25.02.2025.
//

import SwiftUI

struct MainScreen: View {
    @StateObject private var userManager = UserManager()

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {

                if userManager.isLoggedIn {
                    VStack(spacing: 8) {
                        if let name = userManager.displayName {
                            Text("Привет, \(name)! 👋")
                                .font(.title3)
                        }

                        if let url = userManager.photoURL {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 64, height: 64)
                                    .clipShape(Circle())
                            } placeholder: {
                                ProgressView()
                            }
                        }

                        Button("Выйти из аккаунта") {
                            userManager.signOut()
                        }
                        .buttonStyle(.bordered)
                    }
                    .padding()
                } else {
                    GoogleSignInView()
                }

                Spacer()

                NavigationLink("Перейти к предметам") {
                    SubjectsScreen()
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}
