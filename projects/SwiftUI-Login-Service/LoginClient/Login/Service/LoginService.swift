//
//  LoginService.swift
//  Login
//
//  Created by cl-dev on 2019-08-27.
//  Copyright © 2019 Connected. All rights reserved.
//

import UIKit
import Combine

class LoginService: ObservableObject {
    
    private struct Url {
        static let host = URL(string: "http://localhost:8080")!
        static let login = host.appendingPathComponent("login")
    }
    
    func login(username: String, password: String) -> AnyPublisher<Bool, Never> {
        var request = URLRequest(url: Url.login)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody =
            #"""
            {
                "username": "\#(username)",
                "password": "\#(password)"
            }
            """#.data(using: .utf8)

        return URLSession.shared.dataTaskPublisher(for: request)
            .map { (output: URLSession.DataTaskPublisher.Output) -> HTTPURLResponse? in
                output.response as? HTTPURLResponse
            }
            .map { $0?.statusCode == 200 }
            .catch { _ in
                Just(false)
            }
            .eraseToAnyPublisher()
    }
}
