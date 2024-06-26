//
//  Navigation.swift
//  TaskManagementApp
//
//  Created by Hardik Halani on 26/06/24.
//

import SwiftUI

class Router: ObservableObject {
    
    public enum Destination: Codable, Hashable {
        case signIn
        case signUp
        case main
        case taskList
        case taskDetail
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
