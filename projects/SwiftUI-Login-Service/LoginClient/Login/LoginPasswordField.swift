//
//  LoginPasswordField.swift
//  Login
//
//  Created by cl-dev on 7/12/19.
//  Copyright © 2019 Connected. All rights reserved.
//

import SwiftUI

// TODO: refactor to extract the common code with LoginUsernameField
struct LoginPasswordField : View {
    
    @Binding var password: String
    
    var body: some View {
        VStack {
            SecureField("Password", text: $password)
                 .foregroundColor(.white)
            Rectangle()
                .frame(height: 2.0)
                .foregroundColor(Color.white)
                .padding([.top, .bottom], 10)
        }
    }
}

#if DEBUG
struct LoginPasswordField_Previews : PreviewProvider {
    
    @State static var password = ""
    
    static var previews: some View {
        LoginPasswordField(password: $password)
    }
}
#endif
