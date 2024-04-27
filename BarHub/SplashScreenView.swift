//
//  SplashScreenView.swift
//  BarHub
//
//  Created by James Threadgold on 06/03/2024.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                
                VStack {
                    VStack {
                        
                        Image("LogoB1white")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 140)
                        Text("BarHub")
                            .font(Font.custom("Suravaram-Regular",size: 50))
                            .foregroundColor(.white)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
            }
            
            
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
