//
//  LoginView.swift
//  SwiftUILoginScreenFlow
//
//  Created by Ahmet Bostancıklıoğlu on 28.01.2025.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginVM = LoginViewModel()
    @EnvironmentObject var authentication: Authentication
    
    var body: some View {
        VStack {
            Text("My Secure App")
                .font(.largeTitle)
            
            TextField("Email Address", text: $loginVM.credentials.email)
                .keyboardType(.emailAddress)
            
            SecureField("Password", text: $loginVM.credentials.password)
            
            if loginVM.showProgressView {
                ProgressView()
            }
            
            Button("Log in") {
                loginVM.login { success in
                    authentication.updateValidation(success: success)
                }
            }
            .disabled(loginVM.loginDisable)
            .padding(.bottom, 20)
            Image("LaunchScreen")
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
            Spacer()
        }
        .autocapitalization(.none)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
        .disabled(loginVM.showProgressView)
        .alert(item: $loginVM.error) { error in
            Alert(title: Text("Invalid Login"), message: Text(error.localizedDescription))
        }
    }
}

#Preview {
    LoginView()
}
