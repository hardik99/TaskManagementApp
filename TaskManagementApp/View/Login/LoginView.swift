//
//  LoginView.swift
//  TaskManagementApp
//
//  Created by Hardik Halani on 23/06/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    @EnvironmentObject var router: Router

    var body: some View {
        LoadingView(isShowing: $viewModel.showLoader) {
            VStack {
                Spacer()
                
                LoginSignUpTitleView(text: LoginSignUpConstants.signIn)
                
                Group {
                    CustomTextField(title: LoginSignUpConstants.email, imageName: ImageConstants.email, keyboardType: .emailAddress, text: $viewModel.email)
                    
                    PasswordTextField(title: LoginSignUpConstants.password, imageName: ImageConstants.password, text: $viewModel.password, isPasswordVisible: $viewModel.isPasswordVisible)
                }
                .padding(.bottom, 10)
                
                FilledButtonView(title: LoginSignUpConstants.signIn) {
                    viewModel.validate()
                }
                
                Spacer()
                
                BottomButtonView(title: LoginSignUpConstants.dontHaveAccount, buttonTitle: LoginSignUpConstants.signUp) {
                    router.navigate(to: .signUp)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(
                title: Text(GenericConstants.errorTitle),
                message: Text(viewModel.alertMessage),
                dismissButton: .default(Text(GenericConstants.ok))
            )
        }
        .onChange(of: viewModel.navigateToList) { newValue in
            
        }
    }
}

#Preview {
    LoginView()
}
