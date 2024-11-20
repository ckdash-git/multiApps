//
//  Fortgot_Password_View.swift
//  multiApps
//
//  Created by Cachatto Admin on 19/11/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email = ""

    var body: some View {
        NavigationView {
            ZStack {
                // Background color
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea(.all)

                VStack(spacing: 20) {
                    // Illustration
                    Image("forgot-pass")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .foregroundColor(.blue)

                    // Title and Description
                    Text("Forgot Password?")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color("Button_Color"))
                        .multilineTextAlignment(.center)

                    Text("Don't worry! It occurs. Please enter the email address linked with your account.")
                        .font(.subheadline)
                        .foregroundColor(Color("Textfields_Color"))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30)

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
                    .padding(.horizontal, 30)

                    // Send Code Button
                    Button(action: {
                        // Handle login action
                        print("Send Code button tapped")
                    }) {
                        Text("Send Code")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("Button_Color"))
                            .clipShape(CustomCorners(corners: [.bottomLeft, .topRight], radius: 10))
                    }
                    .padding(.horizontal, 30)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Center the VStack
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.white)
                        .shadow(color: .gray.opacity(0.2), radius: 10, x: 0, y: -5)
                )
                .padding(.horizontal, 20)
                .padding(.vertical, 50) // Adjust padding for more centering effect
            }
        }
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}

