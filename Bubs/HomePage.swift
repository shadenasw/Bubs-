//
//  HomePage.swift
//  Bubs
//
//  Created by Ranad aldawood on 27/03/1446 AH.
//

import SwiftUI
import AVFoundation
var audioPlayer: AVAudioPlayer?
struct HomePage: View {
    @State private var bubbleOffset: CGFloat = 0.0
    @State private var scale: CGFloat = 1.0
    @State private var animateBubbles = false
    @State private var animateBubbles1 = false
    @State private var animateBubblesWithSound = false
    @State private var playCount = 0
    
    
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
                        NavigationLink(destination: LevelsPage().navigationBarBackButtonHidden(true)) {
                            Image(systemName: "play.circle.fill")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .padding(.bottom,-50)
                                .foregroundColor(.darkBlue)
                        }
                    }
                    
                    Text("BUBS")
                        .font(.custom("Vanilla", size: 70))
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
                    .frame(width:50, height: 50)
                    .position(x:UIScreen.main.bounds.width/1.9,y: animateBubblesWithSound ? -200:900)
                    .onAppear {
                                        startBubbleAnimationWithSound(repeats: 3)  // Animate bubbles and play sound for 5 repeats
                                    }
            }            .onAppear {
                // Start playing background music when the homepage appears
                GameMusicPlayer.shared.playBackgroundMusic() }
    }
}
    func startBubbleAnimationWithSound(repeats: Int) {
            // Reset the play count
            playCount = 0

            // Animate the bubble with sound
            withAnimation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: false)) {
                animateBubblesWithSound = true
            }

            // Use a Timer to manage sound playback and stop after the required number of repeats
            Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in
                if playCount < repeats {
                    playSound()  // Play the sound
                    playCount += 1
                } else {
                    timer.invalidate()  // Stop the timer after 5 repetitions
                    withAnimation {
                        animateBubblesWithSound = false  // Optionally stop bubble animation
                    }
                }
            }
        }

        // Function to play the sound for the bubble animation
        func playSound() {
            if let path = Bundle.main.path(forResource: "soapBubbles", ofType: "mp3") {
                let url = URL(fileURLWithPath: path)
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: url)
                    audioPlayer?.numberOfLoops = 0  // Play sound only once for each call
                    audioPlayer?.play()
                } catch {
                    print("Error: Could not play the sound file.")
                }
            }
        }
    }

#Preview {
    HomePage()
}
