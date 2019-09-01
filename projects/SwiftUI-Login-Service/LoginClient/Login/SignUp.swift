//
//  SignUp.swift
//  Login
//
//  Created by cl-dev on 7/12/19.
//  Copyright © 2019 Connected. All rights reserved.
//

import SwiftUI
import Combine

struct SignUp : View {
    
    let tapAction: () -> ()
    
    var body: some View {
        VStack {
            Text("Don't have an account?")
                .foregroundColor(.white)
            Button(action: tapAction) {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .font(.title)
            }
        }
    }
}

#if DEBUG
struct SignUp_Previews : PreviewProvider {
    
    static let tapAction = {}
    
    static var previews: some View {
        SignUp(tapAction: tapAction)
            .background(Color.black)
    }
}
#endif
