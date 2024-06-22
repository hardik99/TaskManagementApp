//
//  TaskManagementAppApp.swift
//  TaskManagementApp
//
//  Created by Hardik Halani on 22/06/24.
//

import SwiftUI

@main
struct TaskManagementAppApp: App {
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
