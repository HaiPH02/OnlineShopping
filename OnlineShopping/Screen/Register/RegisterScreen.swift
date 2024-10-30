//
//  RegisterScreen.swift
//  OnlineShopping
//
//  Created by HaiPH7.FA on 17/07/2023.
//

import Foundation
import SwiftUI

struct RegisterScreen: View {
    
    @StateObject var viewModel = RegisterViewModel()
    
    @EnvironmentObject
    var navigator: LoginNavigator
    
    var body: some View {
        ZStack {
            Image("sky")
                .resizable()
                .cornerRadius(20)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                Spacer()
                Text(String.register)
                    .foregroundColor(.white)
                    .font(.custom("PlayfairDisplay-Bold", size: 28))
                Text("ShoppingNow!")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.custom("PlayfairDisplay-Bold", size: 28))
                    .foregroundColor(Color.primary)
                
                TextField(String.username, text: $viewModel.userName)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                SecureField(String.password, text: $viewModel.password)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .privacySensitive()
                
                HStack {
                    Button {
                        viewModel.register(email: viewModel.userName, password: viewModel.password, firstName: viewModel.firstName, lastName: viewModel.lastName)
                    } label: {
                        Spacer()
                        Text(String.register)
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                        Spacer()
                    }
                    .buttonStyle(.bordered)

                }
                
                Spacer()
            }
            .frame(width: 300)
            .padding()
        }
        .transition(.offset(x: 0, y: 850))
        .alert("Did Register Success", isPresented: $viewModel.didRegisterSuccess) {
            // Login
            Button("OK") {
                navigator.pop()
            }
        }
        .alert(item: $viewModel.error) { error in
            Alert(title: Text(error.description))
        }
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}
