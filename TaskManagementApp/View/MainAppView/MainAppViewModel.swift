//
//  MainAppViewModel.swift
//  TaskManagementApp
//
//  Created by Hardik Halani on 26/06/24.
//

import Foundation
import Combine

class MainAppViewModel: ObservableObject {
    
    var isUserAlreadyLoggedIn: Bool = false
    
    private let authService: FirebaseAuthService
    
    init(authService: FirebaseAuthService = FirebaseAuthService()) {
        self.authService = authService
        self.checkUserStatus()
    }

    func checkUserStatus() {
        if self.authService.currentUser() != nil {
            self.isUserAlreadyLoggedIn = true
        } else {
            self.isUserAlreadyLoggedIn = false
        }
    }
}
