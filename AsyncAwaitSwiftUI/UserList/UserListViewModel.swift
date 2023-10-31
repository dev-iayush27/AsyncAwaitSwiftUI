//
//  UserListViewModel.swift
//  AsyncAwaitSwiftUI
//
//  Created by Ayush Gupta on 26/10/23.
//

import Foundation

@MainActor
final class UserListViewModel: ObservableObject {
    
    @Published var users: [User]?
    @Published var userError: UserError?
    @Published var shouldShowAlert = false
    @Published var isLoading = false
    
    func getUsers() async {
        isLoading = true
        do {
            self.users = try await WebService.getUsersData()
            self.isLoading = false
        } catch(let error) {
            userError = UserError.custom(error: error)
            shouldShowAlert = true
            isLoading = false
        }
    }
}
