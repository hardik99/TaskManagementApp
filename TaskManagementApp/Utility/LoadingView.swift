//
//  LoadingView.swift
//  TaskManagementApp
//
//  Created by Hardik Halani on 23/06/24.
//

import SwiftUI

struct LoadingView<Content>: View where Content: View {

    @Binding var isShowing: Bool
    var content: () -> Content

    var body: some View {
        ZStack(alignment: .center) {

            self.content()
                .disabled(self.isShowing)

            ActivityIndicator(isAnimating: .constant(true), style: .large)
                .opacity(self.isShowing ? 1 : 0)

        }
    }
}

struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
