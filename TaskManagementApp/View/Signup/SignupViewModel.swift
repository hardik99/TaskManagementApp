//
//  SignupViewModel.swift
//  TaskManagementApp
//
//  Created by Hardik Halani on 23/06/24.
//

import Foundation
import Combine

class SignupViewModel: ObservableObject {

    @Published var showLoader: Bool = false
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var name: String = ""
    @Published var isPasswordVisible: Bool = false
    @Published var isConfirmPasswordVisible: Bool = false
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    @Published var navigateBack: Bool = false

    private let authService: FirebaseAuthService

    init(authService: FirebaseAuthService = FirebaseAuthService()) {
        self.authService = authService
    }

    func validate() {
        if name.trimmed.isEmpty {
            self.alertMessage = LoginSignUpConstants.Validation.emptyName
            self.showAlert = true
        } else if email.trimmed.isEmpty {
            self.alertMessage = LoginSignUpConstants.Validation.emptyEmail
            self.showAlert = true
        } else if !email.isValidEmail() {
            self.alertMessage = LoginSignUpConstants.Validation.invalidEmail
            self.showAlert = true
        } else if password.trimmed.isEmpty {
            self.alertMessage = LoginSignUpConstants.Validation.emptyPassword
            self.showAlert = true
        } else if !password.isPasswordValid() {
            self.alertMessage = LoginSignUpConstants.Validation.passwordValidation
            self.showAlert = true
        } else if confirmPassword.trimmed.isEmpty {
            self.alertMessage = LoginSignUpConstants.Validation.emptyConfirmPassword
            self.showAlert = true
        } else if password != confirmPassword {
            self.alertMessage = LoginSignUpConstants.Validation.matchPasswordConfirmPassword
            self.showAlert = true
        } else {
            self.signUp()
        }
    }
    
    func signUp() {
        self.showLoader = true
        authService.signUp(name: name, email: email, password: password) { [weak self] result in
            self?.showLoader = false
            switch result {
            case .success:
                self?.navigateBack = true
                self?.alertMessage = LoginSignUpConstants.Validation.userSignUpSuccess
                self?.showAlert = true
            case .failure(let error):
                self?.alertMessage = error.localizedDescription
                self?.showAlert = true
            }
        }
    }

}
