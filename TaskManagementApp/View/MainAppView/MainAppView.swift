//
//  MainAppView.swift
//  TaskManagementApp
//
//  Created by Hardik Halani on 26/06/24.
//

import SwiftUI

struct MainAppView: View {
    
    @StateObject private var router = Router()

    var body: some View {
        NavigationStack(path: $router.navPath) {
            Group {
                LoginView()
            }
            .navigationDestination(for: Router.Destination.self) { destination in
                switch destination {
                case .signIn:
                    LoginView()
                case .signUp:
                    SignupView()
                default:
                    EmptyView()
                }
            }
        }
        .environmentObject(router)
    }
}

#Preview {
    MainAppView()
}
