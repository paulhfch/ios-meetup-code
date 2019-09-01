//
//  LoginUsernameField.swift
//  Login
//
//  Created by cl-dev on 7/12/19.
//  Copyright © 2019 Connected. All rights reserved.
//

import SwiftUI

struct LoginUsernameField : View {
    
    @Binding var username: String
    
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .foregroundColor(.white)
            Rectangle()
                .frame(height: 2.0)
                .foregroundColor(Color.white)
                .padding(.vertical, 10)
        }
    }
}

#if DEBUG
struct LoginUsernameField_Previews : PreviewProvider {
    
    @State static var username = ""
    
    static var previews: some View {
        LoginUsernameField(username: $username)
    }
}
#endif
