//
//  RegisterView.swift
//  iOS_Project_5
//
//  Created by Daniel Latos on 14/01/2024.
//
import SwiftUI
import Foundation

struct RegisterView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var signupError: Bool = false
    @State private var signupTrigger: Bool? = nil
    
    
    var body: some View {
            VStack {
                Spacer()
                
                Text("SIGN UP")
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
                
                if signupError {
                    Text("Username and password can't be blank")
                        .foregroundStyle(.red)
                }
                
                NavigationLink(
                    destination: ContentView(),
                    tag: true,
                    selection: $signupTrigger
                ) {
                    Button {
                        Task {
                            do {
                                let url = URL(string: "http://0.0.0.0:8010/api/register")
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
                                    signupError = false
                                    signupTrigger = true
                                } else {
                                    print("login failure")
                                    signupError = true
                                }
                            } catch {
                                print("Download error")
                            }
                        }
                    } label: {
                        Text("SIGN UP")
                            .foregroundStyle(.green
                            )
                    }.padding()
                }
                Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
