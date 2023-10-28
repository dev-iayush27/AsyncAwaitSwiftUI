//
//  WebService.swift
//  AsyncAwaitSwiftUI
//
//  Created by Ayush Gupta on 26/10/23.
//

import Foundation

final class WebService {
    
    static func getUsersData() async throws -> [User] {
        let urlString = "https://api.github.com/users"
        guard let url = URL(string: urlString) else {
            throw UserError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw UserError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([User].self, from: data)
        } catch {
            throw UserError.invalidData
        }
    }
}
