//
//  LoginViewModel.swift
//  TaskManagementApp
//
//  Created by Hardik Halani on 23/06/24.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {

    @Published var showLoader: Bool = false
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isPasswordVisible: Bool = false
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var navigateToList: Bool = false

    private let authService: FirebaseAuthService

    init(authService: FirebaseAuthService = FirebaseAuthService()) {
        self.authService = authService
    }

    func validate() {
        if email.trimmed.isEmpty {
            self.alertMessage = LoginSignUpConstants.Validation.emptyEmail
            self.showAlert = true
        } else if !email.isValidEmail() {
            self.alertMessage = LoginSignUpConstants.Validation.invalidEmail
            self.showAlert = true
        } else if password.trimmed.isEmpty {
            self.alertMessage = LoginSignUpConstants.Validation.emptyPassword
            self.showAlert = true
        } else {
            self.logIn()
        }
    }

    private func logIn() {
        self.showLoader = true
        authService.logIn(email: email, password: password) { [weak self] result in
            self?.showLoader = false
            switch result {
            case .success:
                self?.navigateToList = true
            case .failure(let error):
                self?.alertMessage = error.localizedDescription
                self?.showAlert = true
            }
        }
    }

}
