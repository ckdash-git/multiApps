//
//  LoginView.swift
//  multiApps
//
//  Created by Cachatto Admin on 18/11/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var navigateToRegister = false
    @State private var showForgotPassword = false

    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationView {
                VStack(spacing: 20) {
                    // Logo
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(Color("Button_Color"))
                        .overlay(
                            Circle()
                                .stroke(Color.black, lineWidth: 2)
                                .frame(width: 80, height: 80)
                        )

                    // Welcome Text
                    Text("Welcome to YYYYY")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 20)

                    Text("XXXXXXXXX")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Spacer().frame(height: 10)

                    // Email TextField
                    VStack(alignment: .leading) {
                        Text("Email")
                            .foregroundColor(Color("Button_Color"))
                            .font(.footnote)

                        TextField("Enter your email", text: $email)
                            .padding()
                            .background(Color(.systemGray6))
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .clipShape(CustomCorners(corners: [.topLeft, .bottomRight], radius: 10))
                    }
                    .padding(.horizontal)

                    // Password TextField
                    VStack(alignment: .leading) {
                        Text("Password")
                            .foregroundColor(Color("Button_Color"))
                            .font(.footnote)

                        HStack {
                            if isPasswordVisible {
                                TextField("Enter your password", text: $password)
                            } else {
                                SecureField("Enter your password", text: $password)
                            }

                            Button(action: {
                                isPasswordVisible.toggle()
                            }) {
                                Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .clipShape(CustomCorners(corners: [.topLeft, .bottomRight], radius: 10))
                    }
                    .padding(.horizontal)

                    // Login Button
                    Button(action: {
                        // Handle login action
                        print("Login button tapped")
                    }) {
                        Text("Login")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("Button_Color"))
                            .clipShape(CustomCorners(corners: [.topLeft, .bottomRight], radius: 10))
                    }
                    .padding(.horizontal)

                    // Forgot Password Link
                  
                                        Button(action: {
                                            showForgotPassword = true // Show the Forgot Password screen
                                        }) {
                                            Text("Forgot password?")
                                                .font(.footnote)
                                                .foregroundColor(Color("Button_Color"))
                                        }
                                        .fullScreenCover(isPresented: $showForgotPassword) {
                                            ForgotPasswordView() // Present the Forgot Password view
                                        }


                    Spacer()

                    // Register Link
                    HStack {
                        Text("Don't have an account?")
                            .foregroundColor(.gray)

                        NavigationLink(destination: RegistratioView(), isActive: $navigateToRegister) {
                            Button(action: {
                                navigateToRegister = true
                            }) {
                                Text("Register!")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Button_Color"))
                            }
                        }
                    }
                    .font(.footnote)
                    .padding(.bottom, 20)
                }
                .padding()
                .navigationBarBackButtonHidden(true)
            }
        } else {
            Text("iOS version is not supported")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct CustomCorners: Shape {
    var corners: UIRectCorner
    var radius: CGFloat

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
