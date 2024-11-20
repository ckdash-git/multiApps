//
//  RegisterView.swift
//  multiApps
//
//  Created by Cachatto Admin on 18/11/24.
//

import SwiftUI

struct RegistratioView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showAlert = false
    @State private var isPasswordVisible: Bool = false
    @State private var navigateToLogin = false
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>

    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationView {
                VStack {
                    Image("register")
//                        .resizable()
//                        .font(.largeTitle)
//                        .foregroundColor(.blue)
//                        .padding()
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.blue)
                    
                    Text("Fill Your Personal Information")
                        .font(.headline)
                        .foregroundColor(Color("Button_Color"))
                        .padding(.bottom)
                    
                    // Name Input
                    VStack(alignment: .leading) {
                        Text("Name")
                            .foregroundColor(Color("Button_Color"))
                            .font(.footnote)
                        
                        TextField("Enter your name", text: $username)
                            .padding()
                            .background(Color(.systemGray6))
                            .keyboardType(.default)
                            .autocapitalization(.words)
                            .clipShape(CustomCorners(corners: [.topLeft, .bottomRight], radius: 10))
                    }
                    .padding(.horizontal)
                    
                    // Email Input
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
                    
                    // Password Input
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
                    
                    // Confirm Password Input
                    VStack(alignment: .leading) {
                        Text("Confirm Password")
                            .foregroundColor(Color("Button_Color"))
                            .font(.footnote)
                        
                        HStack {
                            if isPasswordVisible {
                                TextField("Enter your confirm password", text: $confirmPassword)
                            } else {
                                SecureField("Enter your confirm password", text: $confirmPassword)
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
                    .padding()
                    
                    // Register Button
                    Button(action: {
                        if password != confirmPassword {
                            showAlert = true
                        } else {
                            // Handle registration logic here
                        }
                    }) {
                        Text("Register")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("Button_Color"))
                            .clipShape(CustomCorners(corners: [.topLeft, .bottomRight], radius: 10))
                    }
                    .padding(.horizontal)
                    
//                    Spacer()
                    
                    // Sign In Link
                    HStack {
                        Text("Already have an account?")
                            .foregroundColor(.gray)
                        
                        //                    NavigationLink(destination: LoginView(), isActive: $navigateToLogin) {
                                                Text("Sign In")
                                                    .fontWeight(.bold)
                                                    .foregroundColor(Color("Button_Color"))
                        //                    }
                    }
                    .font(.footnote)
                    .padding(.top, 20)
//                    .padding(.bottom, 20)
                    .alert("Error", isPresented: $showAlert) {
                        Button("OK", role: .cancel) { }
                    } message: {
                        Text("Passwords do not match")
                    }
                }
                .padding()
            }
            .navigationDestination(isPresented: $navigateToLogin){LoginView()}
            .navigationBarBackButtonHidden(true) // Hide the navigation bar
            .navigationBarItems(leading:Button(action: {
                //                NavLogin = true
                presentationMode.wrappedValue.dismiss()
            })
                                {Image(systemName: "arrow.backward")
                    .foregroundColor(Color("Button_Color"))
                .font(.title2)})
            
        }
//            .padding()
        }
    }


struct RegistratioViewView_Previews: PreviewProvider {
    static var previews: some View {
        RegistratioView()
    }
}
