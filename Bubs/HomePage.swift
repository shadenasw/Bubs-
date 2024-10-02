//
//  HomePage.swift
//  Bubs
//
//  Created by Ranad aldawood on 27/03/1446 AH.
//

import SwiftUI

struct HomePage: View {
    @State private var bubbleOffset: CGFloat = 0.0
    @State private var scale: CGFloat = 1.0
    @State private var animateBubbles = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("IMG_3451")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                VStack {
                    Button(action: {
                        print("play button pressed")
                    }) {
                        NavigationLink(destination: LevelsPage()) {
                            Image(systemName: "play.circle.fill")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .padding(.bottom,-50)
                                .foregroundColor(.darkBlue)
                        }
                    }
                    
                    Text("BUBS")
                        .font(.system(size: 70, weight: .bold, design: .rounded))
                        .italic()
                        .foregroundStyle(.darkBlue)
                        .padding(.top, -190)
                }
                Image("bubbles")
                    .resizable()
                    .frame(width:150, height: 150)
                    .position(x:UIScreen.main.bounds.width/6,y: animateBubbles ? -100:650)
                    .onAppear{
                        withAnimation(Animation.easeInOut(duration: 3)
                            .repeatForever(autoreverses: false))
                        { animateBubbles = true}}
                Image("bubbles")
                    .resizable()
                    .frame(width:100, height: 100)
                    .position(x:UIScreen.main.bounds.width/3.5,y: animateBubbles ? -300:600)
                    .onAppear{
                        withAnimation(Animation.easeInOut(duration: 3)
                            .repeatForever(autoreverses: false))
                        { animateBubbles = true}}
                Image("bubbles")
                    .resizable()
                    .frame(width:90, height: 90)
                    .position(x:UIScreen.main.bounds.width/18,y: animateBubbles ? -350:500)
                    .onAppear{
                        withAnimation(Animation.easeInOut(duration: 3)
                            .repeatForever(autoreverses: false))
                        { animateBubbles = true}}
                Image("bubbles")
                    .resizable()
                    .frame(width:80, height: 80)
                    .position(x:UIScreen.main.bounds.width/6,y: animateBubbles ? -200:500)
                    .onAppear{
                        withAnimation(Animation.easeInOut(duration: 3)
                            .repeatForever(autoreverses: false))
                        { animateBubbles = true}}
                Image("bubbles")
                    .resizable()
                    .frame(width:170, height: 170)
                    .position(x:UIScreen.main.bounds.width/30,y: animateBubbles ? -100:700)
                    .onAppear{
                        withAnimation(Animation.easeInOut(duration: 3)
                            .repeatForever(autoreverses: false))
                        { animateBubbles = true}}
                Image("bubbles")
                    .resizable()
                    .frame(width:80, height: 80)
                    .position(x:UIScreen.main.bounds.width/4,y: animateBubbles ? -200:500)
                    .onAppear{
                        withAnimation(Animation.easeInOut(duration: 3)
                            .repeatForever(autoreverses: false))
                        { animateBubbles = true}}
                Image("bubbles")
                    .resizable()
                    .frame(width:130, height: 130)
                    .position(x:UIScreen.main.bounds.width/3,y: animateBubbles ? -100:700)
                    .onAppear{
                        withAnimation(Animation.easeInOut(duration: 3)
                            .repeatForever(autoreverses: false))
                        { animateBubbles = true}}
                Image("bubbles")
                    .resizable()
                    .frame(width:50, height: 50)
                    .position(x:UIScreen.main.bounds.width/9,y: animateBubbles ? -500:500)
                    .onAppear{
                        withAnimation(Animation.easeInOut(duration: 3)
                            .repeatForever(autoreverses: false))
                        { animateBubbles = true}}
                Image("bubbles")
                    .resizable()
                    .frame(width:50, height: 50)
                    .position(x:UIScreen.main.bounds.width/20,y: animateBubbles ? -200:600)
                    .onAppear{
                        withAnimation(Animation.easeInOut(duration: 3)
                            .repeatForever(autoreverses: false))
                        { animateBubbles = true}}
                Image("bubbles")
                    .resizable()
                    .frame(width:170, height: 170)
                    .position(x:UIScreen.main.bounds.width/1.2,y: animateBubbles ? -200:600)
                    .onAppear{
                        withAnimation(Animation.easeInOut(duration: 3)
                            .repeatForever(autoreverses: false))
                        { animateBubbles = true}}
                Image("bubbles")
                    .resizable()
                    .frame(width:80, height: 80)
                    .position(x:UIScreen.main.bounds.width/1.1,y: animateBubbles ? -500:600)
                    .onAppear{
                        withAnimation(Animation.easeInOut(duration: 3)
                            .repeatForever(autoreverses: false))
                        { animateBubbles = true}}
                Image("bubbles")
                    .resizable()
                    .frame(width:80, height: 80)
                    .position(x:UIScreen.main.bounds.width/1.2,y: animateBubbles ? -700:600)
                    .onAppear{
                        withAnimation(Animation.easeInOut(duration: 3)
                            .repeatForever(autoreverses: false))
                        { animateBubbles = true}}
                Image("bubbles")
                    .resizable()
                    .frame(width:50, height: 50)
                    .position(x:UIScreen.main.bounds.width/1.3,y: animateBubbles ? -600:500)
                    .onAppear{
                        withAnimation(Animation.easeInOut(duration: 3)
                            .repeatForever(autoreverses: false))
                        { animateBubbles = true}}
                Image("bubbles")
                    .resizable()
                    .frame(width:180, height: 180)
                    .position(x:UIScreen.main.bounds.width/1.5,y: animateBubbles ? -90:600)
                    .onAppear{
                        withAnimation(Animation.easeInOut(duration: 3)
                            .repeatForever(autoreverses: false))
                        { animateBubbles = true}}
                Image("bubbles")
                    .resizable()
                    .frame(width:80, height: 80)
                    .position(x:UIScreen.main.bounds.width/1.7,y: animateBubbles ? -200:500)
                    .onAppear{
                        withAnimation(Animation.easeInOut(duration: 3)
                            .repeatForever(autoreverses: false))
                        { animateBubbles = true}}
                Image("bubbles")
                    .resizable()
                    .frame(width:80, height: 80)
                    .position(x:UIScreen.main.bounds.width/1.4,y: animateBubbles ? -400:500)
                    .onAppear{
                        withAnimation(Animation.easeInOut(duration: 3)
                            .repeatForever(autoreverses: false))
                        { animateBubbles = true}}
                Image("bubbles")
                    .resizable()
                    .frame(width:180, height: 180)
                    .position(x:UIScreen.main.bounds.width/6,y: animateBubbles ? -5:800)
                    .onAppear{
                        withAnimation(Animation.easeInOut(duration: 4)
                            .repeatForever(autoreverses: false))
                        { animateBubbles = true}}
                Image("bubbles")
                    .resizable()
                    .frame(width:180, height: 180)
                    .position(x:UIScreen.main.bounds.width/1.1,y: animateBubbles ? -50:700)
                    .onAppear{
                        withAnimation(Animation.easeInOut(duration: 3)
                            .repeatForever(autoreverses: false))
                        { animateBubbles = true}}
                Image("bubbles")
                    .resizable()
                    .frame(width:180, height: 180)
                    .position(x:UIScreen.main.bounds.width/1.3,y: animateBubbles ? -5:900)
                    .onAppear{
                        withAnimation(Animation.easeInOut(duration: 3)
                            .repeatForever(autoreverses: false))
                        { animateBubbles = true}}
                Image("bubbles")
                    .resizable()
                    .frame(width:80, height: 80)
                    .position(x:UIScreen.main.bounds.width/1.7,y: animateBubbles ? -200:500)
                    .onAppear{
                        withAnimation(Animation.easeInOut(duration: 3)
                            .repeatForever(autoreverses: false))
                        { animateBubbles = true}}
                Image("bubbles")
                    .resizable()
                    .frame(width:100, height: 100)
                    .position(x:UIScreen.main.bounds.width/1.7,y: animateBubbles ? -100:900)
                    .onAppear{
                        withAnimation(Animation.easeInOut(duration: 3)
                            .repeatForever(autoreverses: false))
                        { animateBubbles = true}}
                Image("bubbles")
                    .resizable()
                    .frame(width:80, height: 80)
                    .position(x:UIScreen.main.bounds.width/9,y: animateBubbles ? -200:700)
                    .onAppear{
                        withAnimation(Animation.easeInOut(duration: 3)
                            .repeatForever(autoreverses: false))
                        { animateBubbles = true}}
                Image("bubbles")
                    .resizable()
                    .frame(width:80, height: 80)
                    .position(x:UIScreen.main.bounds.width/1.9,y: animateBubbles ? -200:900)
                    .onAppear{
                        withAnimation(Animation.easeInOut(duration: 3)
                            .repeatForever(autoreverses: false))
                        { animateBubbles = true}}
            }
        }
    }
}

#Preview {
    HomePage()
}
