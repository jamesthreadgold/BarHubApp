//
//  News.swift
//  BarHub
//
//  Created by James Threadgold on 5/03/2024.
//

import SwiftUI

struct News: View {
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
                
                Text("News")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .position(CGPoint(x: 71, y: 35))
                    .foregroundColor(.white)
                
                Text("& Promos")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .position(CGPoint(x: 75, y: 70))
                    .foregroundColor(.white)
            }
            
            VStack {
                // Search bar
                SearchBarSection()
                    .position(CGPoint(x: 200, y: 150))
                
                Spacer()
                
                // Filter buttons
                HStack {
                    Spacer()
                    
                    HStack {
                        Text("All")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding(.top, 10.0)
                    .padding(.bottom, 10.0)
                    .padding(.trailing, 24)
                    .padding(.leading, 24)
                    .background(
                        UnevenRoundedRectangle(topLeadingRadius: 18, bottomLeadingRadius: 18, bottomTrailingRadius: 18, topTrailingRadius: 18)
                            .foregroundColor(Color(red: 105/255, green: 74/255, blue: 181/255))
                    )
                    
                    HStack {
                        Image(systemName: "location.circle")
                            .padding(.leading, 0)
                        
                        Text("Nearby")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                    .padding(.top, 10.0)
                    .padding(.bottom, 10.0)
                    .padding(.trailing, 10)
                    .padding(.leading, 10)
                    .background(
                        UnevenRoundedRectangle(topLeadingRadius: 18, bottomLeadingRadius: 18, bottomTrailingRadius: 18, topTrailingRadius: 18)
                            .foregroundColor(Color(red: 0.941, green: 0.941, blue: 0.941))
                    )
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .padding(.leading, 0)
                        
                        Text("Location")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                    .padding(.top, 10.0)
                    .padding(.bottom, 10.0)
                    .padding(.trailing, 10)
                    .padding(.leading, 10)
                    .background(
                        UnevenRoundedRectangle(topLeadingRadius: 18, bottomLeadingRadius: 18, bottomTrailingRadius: 18, topTrailingRadius: 18)
                            .foregroundColor(Color(red: 0.941, green: 0.941, blue: 0.941))
                    )
                    
                    Spacer()
                }
                
                // Latest section
                Text("Latest")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .padding(.trailing, 250)
                
                // Offers section
                HStack {
                    VStack {
                        HStack {
                            Text("The Lazy Dog")
                                .font(.system(size: 24))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Image(systemName: "dog")
                                .padding(.leading, 0)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 26))
                        }
                        .padding(.trailing, 34)
                        
                        Text("2 For 1 Cocktails for")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.trailing, 15)
                        
                        Text("the whole of janruary")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("January 1, 2024 - 31/1")
                            .font(.system(size: 13))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 1)
                            .padding(.trailing, 90)
                    }
                    .padding(.top, 20.0)
                    .padding(.bottom, 20.0)
                    .padding(.trailing, 25)
                    .padding(.leading, 25)
                    .background(
                        UnevenRoundedRectangle(topLeadingRadius: 10, bottomLeadingRadius: 10, bottomTrailingRadius: 10, topTrailingRadius: 10)
                            .foregroundColor(Color(red: 105/255, green: 74/255, blue: 181/255))
                    )
                    .fixedSize()
                    .padding(.leading, 40)
                    
                    UnevenRoundedRectangle(topLeadingRadius: 10, bottomLeadingRadius: 10, bottomTrailingRadius: 0, topTrailingRadius: 0)
                        .foregroundColor(Color(red: 201/255, green: 186/255, blue: 245/255))
                        .padding(.top, 21)
                        .padding(.bottom, 21)
                        .padding(.leading, 20)
                }
                
                HStack {
                    // "Around Bristol" section title
                    Text("Around Bristol")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .padding(.trailing, 90)
                    
                    // "See All" button
                    Text("See All")
                        .fontWeight(.regular)
                        .font(.system(size: 20))
                        .foregroundColor(Color(red: 105/255, green: 74/255, blue: 181/255))
                }
                
                HStack {
                    // News item 1
                    ZStack {
                        Image("News1.1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 160)
                            .clipShape(UnevenRoundedRectangle(topLeadingRadius: 20, bottomLeadingRadius: 15, bottomTrailingRadius: 15, topTrailingRadius: 20))
                        
                        UnevenRoundedRectangle(topLeadingRadius: 25, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 25)
                            .frame(width: 160)
                            .foregroundColor(Color(red: 238/255, green: 238/255, blue: 238/255))
                            .padding(.top, 125)
                        
                        Text("New Taproom")
                            .fontWeight(.medium)
                            .font(.system(size: 18))
                            .padding(.top, 90)
                        
                        Text("pub in Bristol")
                            .fontWeight(.medium)
                            .font(.system(size: 18))
                            .padding(.top, 140)
                            .padding(.trailing, 6)
                    }
                    
                    // News item 2
                    ZStack {
                        Image("News2.2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 160)
                            .clipShape(UnevenRoundedRectangle(topLeadingRadius: 20, bottomLeadingRadius: 15, bottomTrailingRadius: 15, topTrailingRadius: 20))
                        
                        UnevenRoundedRectangle(topLeadingRadius: 25, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 25)
                            .frame(width: 160)
                            .foregroundColor(Color(red: 238/255, green: 238/255, blue: 238/255))
                            .padding(.top, 125)
                        
                        Text("Bristol's amazing")
                            .fontWeight(.medium)
                            .font(.system(size: 18))
                            .padding(.top, 90)
                        
                        Text("outdoor socials")
                            .fontWeight(.medium)
                            .font(.system(size: 18))
                            .padding(.top, 140)
                            .padding(.trailing, 6)
                    }
                }
            }
        }
    }
}

#Preview {
    News()
}
