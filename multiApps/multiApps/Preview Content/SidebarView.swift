//
//  SidebarView.swift
//  multiApps
//
//  Created by Cachatto Admin on 18/11/24.
//
import SwiftUI

struct UserProfileView: View {
    @State private var isVegModeOn = false // Toggle state for Veg Mode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Profile Section
                HStack {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 60, height: 60)
                        .overlay(
                            Text("C")
                                .font(.title)
                                .foregroundColor(.white)
                        )
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("XXXXXX")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Text("YYYYYY.gmail.com")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        
                        Button(action: {
                            print("View Activity tapped")
                        }) {
                            Text("ZZZZZ")
                                .font(.footnote)
                                .foregroundColor(.red)
                        }
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
                
                
                // App Update Section
                HStack {
                    Text("App update available")
                    Spacer()
                    Text("v18.8.1")
                        .font(.footnote)
                        .foregroundColor(.red)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
                // Profile Completion Section
                HStack {
                    Text("Your profile")
                    Spacer()
                    Text("32% completed")
                        .font(.footnote)
                        .foregroundColor(.orange)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
                // Veg Mode Toggle
                HStack {
                    Text("Veg Mode")
                    Spacer()
                    Toggle("", isOn: $isVegModeOn)
                        .labelsHidden()
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
                // Appearance Section
                HStack {
                    Text("Appearance")
                    Spacer()
                    Text("Light")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
                // Food Orders Section
                VStack(alignment: .leading) {
                    Text("Food Orders")
                        .font(.headline)
                        .foregroundColor(.red)
                    
                    List {
                        NavigationLink(destination: Text("Your Orders Screen")) {
                            Text("Your orders")
                        }
                        
                        NavigationLink(destination: Text("Favorite Orders Screen")) {
                            Text("Favorite orders")
                        }
                    }
//                    .frame(height: 130)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }
                
            }
            .padding()
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}
//
//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            UserProfileView()
//        }
//    }
//}
