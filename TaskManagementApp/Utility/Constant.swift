//
//  Constant.swift
//  TaskManagementApp
//
//  Created by Hardik Halani on 26/06/24.
//

import Foundation

struct GenericConstants {
    static let appTitle = NSLocalizedString("Task Management", comment: "")
    static let errorTitle = NSLocalizedString("Error", comment: "")
    static let ok = NSLocalizedString("OK", comment: "")
}

struct ImageConstants {
    static let name = NSLocalizedString("person", comment: "")
    static let email = NSLocalizedString("envelope", comment: "")
    static let password = NSLocalizedString("lock", comment: "")
    static let backButton = NSLocalizedString("arrow.left", comment: "")
}

struct LoginSignUpConstants {
    static let signIn = NSLocalizedString("Sign In", comment: "")
    static let signUp = NSLocalizedString("Sign Up", comment: "")
    static let email = NSLocalizedString("Email", comment: "")
    static let name = NSLocalizedString("Name", comment: "")
    static let password = NSLocalizedString("Password", comment: "")
    static let confirmPassword = NSLocalizedString("Confirm Password", comment: "")
    static let dontHaveAccount = NSLocalizedString("Don't have an account?", comment: "")
    static let alreadyHaveAccount = NSLocalizedString("Already have an account?", comment: "")
    
    struct Validation {
        static let alreadyHaveAccount = NSLocalizedString("Already have an account?", comment: "")
        static let emptyName = NSLocalizedString("Please enter name", comment: "")
        static let emptyEmail = NSLocalizedString("Please enter email", comment: "")
        static let invalidEmail = NSLocalizedString("Please enter valid email", comment: "")
        static let emptyPassword = NSLocalizedString("Please enter password", comment: "")
        static let passwordValidation = NSLocalizedString("Password must be at least 8 characters long, include 1 capital letter, 1 small letter, 1 number, and 1 special character", comment: "")
        static let emptyConfirmPassword = NSLocalizedString("Please enter confirm password", comment: "")
        static let matchPasswordConfirmPassword = NSLocalizedString("Password and confirm password should be same", comment: "")
        static let userSignUpSuccess = NSLocalizedString("User sign up successfully", comment: "")
        static let userSignInSuccess = NSLocalizedString("User login successfully", comment: "")

    }
}

