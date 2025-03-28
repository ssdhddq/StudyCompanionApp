//
//  StudyCompanionApp.swift
//  StudyCompanion
//
//  Created by SSDHDDQ on 25.02.2025.
//

import SwiftUI
import Firebase

@main
struct StudyCompanionApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
        //FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainScreen()
        }
    }
}
