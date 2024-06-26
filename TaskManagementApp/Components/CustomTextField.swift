//
//  CustomTextField.swift
//  TaskManagementApp
//
//  Created by Hardik Halani on 26/06/24.
//

import SwiftUI

struct CustomTextField: View {
    var title: String
    var imageName: String
    var keyboardType: UIKeyboardType = .default
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 16, height: 16)
                .foregroundColor(.gray)
            
            TextField(title, text: $text)
                .keyboardType(keyboardType)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}

#Preview {
    CustomTextField(title: "Name", imageName: "person", text: .constant(""))
}
