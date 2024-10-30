//
//  LoginScreen.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 17/07/2023.
//

import Foundation
import SwiftUI

struct LoginScreen: View {
    @StateObject var viewModel = LoginViewModel()
    @StateObject var navigator = LoginNavigator()
    
    @ViewBuilder
    private func destination(from pushable: LoginNavigator.Pushable) -> some View {
        switch pushable {
        case .register:
            RegisterScreen()
        case .forgetPassword:
            Color.clear
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("sky")
                    .resizable()
                    .cornerRadius(20)
                    .ignoresSafeArea()
                VStack(alignment: .leading, spacing: 20) {
                    Spacer()
                    Text("ShoppingNow!")
                        .font(.custom("PlayfairDisplay-Bold", size: 28))
                        .foregroundColor(Color.primary)
                    Text(String.logIn)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .medium, design: .rounded))
                    TextField(String.username, text: $viewModel.username)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                              SecureField(String.password, text: $viewModel.password)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .privacySensitive()
                    HStack {
                        Spacer()
                        Button(String.forgotPassword) {
                            viewModel.logPressed()
                        }
                        .tint(.red.opacity(0.8))
                        Spacer()
                        Button(String.logIn) {
                            viewModel.login(email: viewModel.username, password: viewModel.password)
                        }
                        .buttonStyle(.bordered)
                        Spacer()
                    }

                    Spacer()
                    HStack {
                        Spacer()
                        Text(String.doHaveAccount)
                        Button {
                            navigator.push(to: .register)
                        } label: {
                            Text(String.register)
                        }

                        Spacer()
                    }
                }
                .alert("Access denied", isPresented: $viewModel.invalid) {
                    Button("Dismiss") {
                        viewModel.logPressed()
                    }
                }
                .frame(width: 300)
                .padding()
            }
            .transition(.offset(x: 0, y: 850))
            .alert("Did Login Success", isPresented: $viewModel.didLoginSuccess) {
                // Login
                Button("OK") {
                    // logic
                }
            }
            .alert(item: $viewModel.error) { error in
                Alert(title: Text(error.description))
            }
            .background(
                ZStack {
                    ForEach(LoginNavigator.Pushable.allCases, id: \.self) { pushable in
                        NavigationLink(
                            "",
                            destination: destination(from: pushable),
                            tag: pushable,
                            selection: $navigator.pushing
                        )
                    }
                }.opacity(.leastNonzeroMagnitude)
            )
        }
        .environmentObject(navigator)
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
