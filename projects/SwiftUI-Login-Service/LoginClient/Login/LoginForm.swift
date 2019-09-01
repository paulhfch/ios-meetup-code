//
//  LoginForm.swift
//  Login
//
//  Created by cl-dev on 7/12/19.
//  Copyright © 2019 Connected. All rights reserved.
//

import SwiftUI
import Combine

struct LoginForm : View {
    
    @Binding var username: String
    @Binding var password: String
    let tapAction: () -> ()
        
    var body: some View {
        VStack {
            Image("logo")
                .padding(.bottom, 20)
            LoginUsernameField(username: $username)
            LoginPasswordField(password: $password)
            Spacer(minLength: 50)
            Button(action: tapAction) {
                HStack {
                    Spacer()
                    Text("Login")
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                    Spacer()
                }.padding()
                .cornerRadius(10)
            }
            .background(Color.blue.opacity(0.9))
        }
    }
}

#if DEBUG
struct LoginForm_Previews : PreviewProvider {
    
    static let tapAction: () -> () = { }
    @State static var username = ""
    @State static var password = ""
    
    static var previews: some View {
        LoginForm(username: $username,
                  password: $password,
                  tapAction: tapAction)
            .background(Color.black)
    }
}
#endif
