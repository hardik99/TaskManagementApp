//
//  PasswordTextField.swift
//  TaskManagementApp
//
//  Created by Hardik Halani on 26/06/24.
//

import SwiftUI

struct PasswordTextField: View {
    
    var title: String
    var imageName: String
    @Binding var text: String
    @Binding var isPasswordVisible: Bool

    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16, height: 16)
                    .foregroundColor(.gray)
                
                if isPasswordVisible {
                    TextField(title, text: $text)
                } else {
                    SecureField(title, text: $text)
                }
                
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
        }
    }
}

#Preview {
    PasswordTextField(title: "Password", imageName: "lock", text: .constant(""), isPasswordVisible: .constant(false))
}
