//
//  ContentView.swift
//  Login
//
//  Created by cl-dev on 7/12/19.
//  Copyright © 2019 Connected. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView : View {
    
    @EnvironmentObject var loginService: LoginService
    
    @State private var username = ""
    @State private var password = ""

    @State private var isLoginSuccessful = false
    @State private var shouldShowLoginResult = false
    @State private var disposeBag = Set<AnyCancellable>()

    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                LoginForm(username: $username,
                          password: $password,
                          tapAction: {
                            self.login()
                    })
                    .padding(.horizontal, 30)
                    .frame(height: 300)
                SignUp(tapAction: { })
                    .padding(.top, 40)
            }
        }
        .alert(isPresented: $shouldShowLoginResult) { () -> Alert in
            Alert(title: Text(isLoginSuccessful ? "Login Successful!" : "Login Failed!"))
        }
    }
    
    private func login() {
        loginService.login(username: username, password: password)
            .handleEvents(receiveCompletion: { _ in
                self.shouldShowLoginResult = true
            })
            .assign(to: \.isLoginSuccessful, on: self)
            .store(in: &disposeBag)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
