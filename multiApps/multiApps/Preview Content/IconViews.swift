//
//  IconViews.swift
//  multiApps
//
//  Created by Own on 18/11/24.
//

import SwiftUI
import SafariServices

// Wrapper to make URL identifiable
struct IdentifiableURL: Identifiable {
    let id = UUID()
    let url: URL
}

struct DiscountItem: Identifiable {
    let id = UUID()
    let title: String
//    let discount: String?
    let imageName: String
    let link: URL
}

struct DiscountGridView: View {
    // Sample data
    let popularItems: [DiscountItem] = [
        DiscountItem(title: "Flipkart", imageName: "flipkart", link: URL(string: "https://www.flipkart.com")!),
        DiscountItem(title: "Amazon", imageName: "amazon", link: URL(string: "https://www.amazon.in")!),
        DiscountItem(title: "Zepto", imageName: "zepto", link: URL(string: "https://www.zepto.com")!),
        DiscountItem(title: "BlinkIt", imageName: "blinkit", link: URL(string: "https://www.blinkit.com")!),
        DiscountItem(title: "Swiggy", imageName: "swiggy", link: URL(string: "https://www.swiggy.com")!),
        DiscountItem(title: "Zomato", imageName: "zomato", link: URL(string: "https://www.zomato.com")!),
        DiscountItem(title: "Uber", imageName: "uber", link: URL(string: "https://tinyurl.com/yhhd6etn")!),
    ]
    
    let newItems: [DiscountItem] = [
        DiscountItem(title: "Licious", imageName: "licious", link: URL("https://www.licious.in/")!),
        DiscountItem(title: "Fresh to Home", imageName: "freshtohome", link: URL("https://www.freshtohome.com/")!),
        DiscountItem(title: "Make My Trip", imageName: "mmt-img", link: URL("https://www.makemytrip.com/")!),
        DiscountItem(title: "Ixigo", imageName: "ixigo", link: URL("https://www.ixigo.com/")!),
        DiscountItem(title: "Irctc", imageName: "irctc", link: URL("https://www.irctc.co.in/nget/train-search")!),
    ]
    
    let socialApps: [DiscountItem] = [
        DiscountItem(title: "WhatsaApp", imageName: "licious", link: URL("https://web.whatsapp.com/")!),
        DiscountItem(title: "Instagram", imageName: "licious", link: URL("https://www.facebook.com/")!),
        DiscountItem(title: "Facebook", imageName: "licious", link: URL("https://www.instagram.com/")!)
        
    ]
    
    @State private var searchText = "" // State for search input
    @State private var selectedLink: IdentifiableURL? // Track the selected link
    
    let columns = Array(repeating: GridItem(.flexible()), count: 3) // 3 columns
    
    // Filtered items for a specific section
    func filteredItemsForSection(_ items: [DiscountItem]) -> [DiscountItem] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                // HStack for Logo and Search Box
                HStack {
                    NavigationLink(destination: UserProfileView()) {
                        // User Logo (just an example here, you can replace with your image)
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white) // Set the color to blue (you can customize)
                    }
                    // Search Bar with search icon inside
                    ZStack(alignment: .leading) {
                        // Background for the whole search bar with corner radius
                              RoundedRectangle(cornerRadius: 10)
                                  .fill(Color(.systemBackground)) // Set the background color here
                                  .frame(height: 40)
                        
                        // Actual TextField
                        TextField("Search apps...", text: $searchText)
                            .padding(10)
                            .background(Color(.systemBackground))
                            .foregroundColor(Color.red
                            )  // Change the text color (including the
                            .cornerRadius(10)
                        
                        
            
                    }
                    .frame(height: 40) // Set the height of the search box
                    HStack {
                        Text("Current location: (locationManager.currentLocation)")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .bold)) // You can adjust the size and weight here
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }

                }
                .padding()
                .background(Color.red)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        
                        // Popular Items Section
                        Section(header: HStack {
                            Text("Popular Apps")
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .leading) // Left align the header text
                                .padding(.top)
                        }) {
                            ForEach(filteredItemsForSection(popularItems)) { item in
                                Button(action: {
                                    selectedLink = IdentifiableURL(url: item.link) // Wrap the URL in IdentifiableURL
                                }) {
                                    VStack {
                                        Image(item.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(maxHeight: 80) // Give some space for the image
                                            .cornerRadius(8)
                                        
                                        // Title and Discount below the image
                                        VStack {
                                            Text(item.title)
                                                .font(.headline)
                                                .foregroundColor(.primary)
                                                .frame(maxWidth: .infinity, alignment: .center)
                                            
//                                            Text(item.discount)
//                                                .font(.subheadline)
//                                                .foregroundColor(.blue)
//                                                .frame(maxWidth: .infinity, alignment: .center)
                                        }
                                        .padding(.top, 8) // Add some space between the image and the text
                                    }
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
                                }
                            }
                        }
                        
                        // New Items Section
                        Section(header: HStack {
                            Text("New Apps")
                                .font(.headline)
                                .frame(maxWidth: .infinity, alignment: .leading) // Left align the header text
                                .padding(.top)
                        }) {
                            ForEach(filteredItemsForSection(newItems)) { item in
                                Button(action: {
                                    selectedLink = IdentifiableURL(url: item.link) // Wrap the URL in IdentifiableURL
                                }) {
                                    VStack {
                                        Image(item.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(maxHeight: 80) // Give some space for the image
                                            .cornerRadius(8)
                                        
                                        // Title and Discount below the image
                                        VStack {
                                            Text(item.title)
                                                .font(.headline)
                                                .foregroundColor(.primary)
                                                .frame(maxWidth: .infinity, alignment: .center)
                                            
//                                            Text(item.discount)
//                                                .font(.subheadline)
//                                                .foregroundColor(.blue)
//                                                .frame(maxWidth: .infinity, alignment: .center)
                                        }
                                        .padding(.top, 8) // Add some space between the image and the text
                                    }
                                    .padding()
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
                                }
                            }
                        }
                        
                    }
                    .padding()
                }
                .background(Color(.systemGroupedBackground))
            }
            .sheet(item: $selectedLink) { identifiableURL in
                SafariView(url: identifiableURL.url) // Present the link in-app using SafariView
            }
        }
    
    }
}

// A wrapper for presenting SafariViewController in SwiftUI
struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}

struct DiscountGridView_Previews: PreviewProvider {
    static var previews: some View {
        DiscountGridView()
    }
}
