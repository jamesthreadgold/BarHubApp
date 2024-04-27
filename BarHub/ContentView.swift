//
//  ContentView.swift
//  BarHub
//
//  Created by James Threadgold on 27/02/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Main tab view
        TabView {
            PlannerView()
                .tabItem {
                    Image(systemName: "pencil.and.scribble")
                    Text("Planner")
                }
            Map()
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }
            News()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("News")
                }
        }
        .onAppear {
            // Customize the tab bar appearance
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            tabBarAppearance.backgroundColor = UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1.0)
            
            // Customize the tab bar item appearance
            let tabBarItemAppearance = UITabBarItemAppearance()
            tabBarItemAppearance.normal.iconColor = .white
            tabBarItemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
            tabBarItemAppearance.selected.iconColor = UIColor(red: 105/255, green: 74/255, blue: 181/255, alpha: 1.0)
            tabBarItemAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(red: 105/255, green: 74/255, blue: 181/255, alpha: 1.0)]
            
            tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
            
            // Apply the customized appearance to the tab bar
            UITabBar.appearance().standardAppearance = tabBarAppearance
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            }
        }
    }
}

struct PlannerView: View {
    var body: some View {
        ZStack {
            // Background color
            Color(red: 105/255, green: 74/255, blue: 181/255)
                .ignoresSafeArea()
            
            // White background with rounded corners
            UnevenRoundedRectangle(topLeadingRadius: 35, topTrailingRadius: 35)
                .padding(.top, 175.0)
                .foregroundColor(.white)
                .ignoresSafeArea()
            
            ZStack {
                // Top bar with logo and title
                Image("LogoB1white")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60)
                    .position(CGPoint(x: 200, y: 50))
                
                Text("Plan")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .position(CGPoint(x: 65, y: 35))
                    .foregroundColor(.white)
                
                Text("& Go!")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .position(CGPoint(x: 58, y: 70))
                    .foregroundColor(.white)
            }
            
            VStack {
                // Search bar
                SearchBarSection()
                    .position(CGPoint(x: 200, y: 150))
                
                Spacer()
                
                // Create new pub crawl button
                HStack {
                    Spacer()
                    
                    Image("Plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                        .clipShape(Circle())
                        .padding(.trailing, 0)
                    
                    Text("Create new pub crawl...")
                        .font(.system(size: 22))
                        .fontWeight(.medium)
                        .foregroundColor(Color(red: 0.5765, green: 0.5765, blue: 0.5765))
                        .padding(.trailing, 20)
                    
                    Spacer()
                }
                .padding(.top, 10.0)
                .padding(.bottom, 10.0)
                .background(
                    UnevenRoundedRectangle(topLeadingRadius: 50, bottomLeadingRadius: 50, bottomTrailingRadius: 50, topTrailingRadius: 50)
                        .foregroundColor(Color(red: 0.941, green: 0.941, blue: 0.941))
                )
                .padding([.leading, .trailing], 30.0)
                .padding(.bottom, 5)
                
                // Active crawls section
                Text("Active Crawls (0)")
                    .fontWeight(.bold)
                    .font(.system(size: 18))
                    .padding(.trailing, 185)
                
                Rectangle()
                    .frame(height: 1)
                    .frame(width: 300)
                    .foregroundColor(.gray)
                
                // Upcoming crawls section
                Text("Upcoming Crawls (2)")
                    .fontWeight(.bold)
                    .font(.system(size: 18))
                    .padding(.trailing, 150)
                
                // Card one
                HStack {
                    Spacer()
                    
                    Image("Groad1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 3))
                    
                    VStack(alignment: .leading, spacing: 6.0) {
                        Text("Claire's Birthday")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                        
                        Text("Bristol, Gloucester Road")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                        
                        HStack {
                            Text("February 21st - Starts at 6:30pm")
                                .font(.system(size: 11))
                                .font(.caption)
                        }
                    }
                    
                    Text("People")
                        .font(.subheadline)
                    
                    Text(" 8 ")
                        .font(.system(size: 18))
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .background(Color(red: 105/255, green: 74/255, blue: 181/255))
                        .cornerRadius(50)
                    
                    Spacer()
                }
                .padding(.top, 10.0)
                .padding(.bottom, 10.0)
                .background(
                    UnevenRoundedRectangle(topLeadingRadius: 55, bottomLeadingRadius: 55)
                        .foregroundColor(Color(red: 0.941, green: 0.941, blue: 0.941))
                )
                .padding([.leading], 20.0)
                
                // Card two
                HStack {
                    Spacer()
                    
                    Image("CityCentre1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 3))
                    
                    VStack(alignment: .leading, spacing: 6.0) {
                        Text("Harry's Stag Do ")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                        
                        Text("Bristol, City Centre")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                        
                        HStack {
                            Text("March 9th - Starts at 7:00pm")
                                .font(.system(size: 11))
                                .font(.caption)
                        }
                    }
                    
                    Text("People")
                        .font(.subheadline)
                    
                    Text(" 12 ")
                        .font(.system(size: 18))
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .background(Color(red: 105/255, green: 74/255, blue: 181/255))
                        .cornerRadius(50)
                    
                    Spacer()
                }
                .padding(.top, 10.0)
                .padding(.bottom, 10.0)
                .background(
                    UnevenRoundedRectangle(topLeadingRadius: 55, bottomLeadingRadius: 55)
                        .foregroundColor(Color(red: 0.941, green: 0.941, blue: 0.941))
                )
                .padding([.leading], 20.0)
                .padding([.bottom], 5.0)
                
                // Past crawls section
                Text("Past Crawls (1)")
                    .fontWeight(.bold)
                    .font(.system(size: 18))
                    .padding(.trailing, 200)
                
                // Card three
                HStack {
                    Spacer()
                    
                    Image("CityCentre1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 3))
                    
                    VStack(alignment: .leading, spacing: 6.0) {
                        Text("Work Party")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                        
                        Text("Bristol, City Centre")
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                        
                        HStack {
                            Text("February 24th - Starts at 6:30pm")
                                .font(.system(size: 11))
                                .font(.caption)
                        }
                    }
                    
                    Text("People")
                        .font(.subheadline)
                    
                    Text(" 6 ")
                        .font(.system(size: 18))
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .background(Color(red: 105/255, green: 74/255, blue: 181/255))
                        .cornerRadius(50)
                    
                    Spacer()
                }
                .padding(.top, 10.0)
                .padding(.bottom, 10.0)
                .background(
                    UnevenRoundedRectangle(topLeadingRadius: 55, bottomLeadingRadius: 55)
                        .foregroundColor(Color(red: 0.941, green: 0.941, blue: 0.941))
                )
                .padding([.leading], 20.0)
                .padding([.bottom], 15.0)
                
                Spacer()
            }
            .padding(.bottom, -7)
        }
    }
}

struct SearchBarSection: View {
    @State private var searchText = ""
    
    var body: some View {
        // Search bar with magnifying glass, microphone, and clear button
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search for a crawl...", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .bold()
            
            Image(systemName: "mic.fill")
                .foregroundColor(.gray)
            
            if !searchText.isEmpty {
                Button(action: {
                    searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.horizontal)
        .padding(.trailing, 20)
        .padding(.leading, 20)
        .shadow(radius: 2)
    }
}

#Preview {
    ContentView()
}
