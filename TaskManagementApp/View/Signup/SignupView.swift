//
//  SignupView.swift
//  TaskManagementApp
//
//  Created by Hardik Halani on 23/06/24.
//

import SwiftUI

struct SignupView: View {
    
    @StateObject var viewModel = SignupViewModel()
    @EnvironmentObject var router: Router

    var body: some View {
        LoadingView(isShowing: $viewModel.showLoader) {
            VStack {
                Spacer()
                
                LoginSignUpTitleView(text: LoginSignUpConstants.signUp)
                
                Group {
                    CustomTextField(title: LoginSignUpConstants.name, imageName: ImageConstants.name, text: $viewModel.name)
                    
                    CustomTextField(title: LoginSignUpConstants.email, imageName: ImageConstants.email, keyboardType: .emailAddress, text: $viewModel.email)
                    
                    PasswordTextField(title: LoginSignUpConstants.password, imageName: ImageConstants.password, text: $viewModel.password, isPasswordVisible: $viewModel.isPasswordVisible)

                    PasswordTextField(title: LoginSignUpConstants.confirmPassword, imageName: ImageConstants.password, text: $viewModel.confirmPassword, isPasswordVisible: $viewModel.isConfirmPasswordVisible)
                }
                .padding(.bottom, 10)
                
                FilledButtonView(title: LoginSignUpConstants.signUp) {
                    viewModel.validate()
                }
                
                Spacer()
                
                BottomButtonView(title: LoginSignUpConstants.alreadyHaveAccount, buttonTitle: LoginSignUpConstants.signIn) {
                    self.router.navigateBack()
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.router.navigateBack()
        }) {
            Image(systemName: ImageConstants.backButton)
                .foregroundColor(.blue)
        })
        .alert(isPresented: $viewModel.showAlert) {
            return Alert(
                title: Text(viewModel.navigateBack ? GenericConstants.appTitle : GenericConstants.errorTitle),
                  message: Text(viewModel.alertMessage),
                  dismissButton: .default(Text(GenericConstants.ok), action: {
                      if viewModel.navigateBack {
                          self.router.navigateBack()
                      }
                  })
              )
        }
    }
}

struct LoginSignUpTitleView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.bottom, 20)
    }
}

struct FilledButtonView: View {
    
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.purple)
                .cornerRadius(8)
        }
        .padding(.top, 20)
    }
}

struct BottomButtonView: View {
    var title: String
    var buttonTitle: String
    var action: () -> Void
    
    var body: some View {
        HStack {
            Text(title)
            Button(action: {
                action()
            }) {
                Text(buttonTitle)
                    .foregroundColor(.orange)
            }
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    SignupView()
}
