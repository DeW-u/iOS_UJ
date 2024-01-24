//
//  LoginView.swift
//  iOS_Project_5
//
//  Created by Daniel Latos on 14/01/2024.
//
import SwiftUI
import Foundation

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var loginError: Bool = false
    @State var loginTrigger: Bool? = nil
    
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("LOGIN")
                    .bold()
                Spacer()
                
                TextField(
                    "Username",
                    text: $username
                )
                .textFieldStyle(
                    .roundedBorder
                )
                .padding()
                
                SecureField(
                    "Password",
                    text: $password
                )
                .textFieldStyle(
                    .roundedBorder
                )
                .padding()
                
                if loginError {
                    Text("Incorrect login username or password")
                        .foregroundStyle(.red)
                }
                
                NavigationLink(
                    destination: ContentView(),
                    tag: true,
                    selection: $loginTrigger
                ) {
                    Button {
                        Task {
                            do {
                                let url = URL(string: "http://0.0.0.0:8010/api/login")
                                var request = URLRequest(url: url!)
                                request.httpMethod = "POST"
                                let data = try! JSONEncoder().encode(
                                    AuthDomain(
                                        username: username,
                                        password: password
                                    )
                                )
                                request.httpBody = data
                                request.setValue(
                                    "application/json",
                                    forHTTPHeaderField: "Content-Type"
                                )
                                let (_, response) = try await URLSession.shared.data(for: request)
                                
                                let statusCode = (response as! HTTPURLResponse).statusCode
                                
                                if statusCode == 200 {
                                    print("login successful")
                                    loginError = false
                                    loginTrigger = true
                                } else {
                                    print("login failure")
                                    loginError = true
                                }
                            } catch {
                                print("Download error")
                            }
                        }
                    } label: {
                        Text("LOGIN")
                            .foregroundStyle(.green)
                    }.padding()
                }
                
                Spacer()
                
                Text("Don't have an account?")
                
                NavigationLink {
                    RegisterView()
                } label: {
                    Text("SIGN UP")
                        .foregroundStyle(.red)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
