//
//  FightingPage.swift
//  Bubs
//
//  Created by Haya Albaker on 29/09/2024.
//

import SwiftUI
import AVFoundation

struct FightingPage: View {
    @State private var enemyHealth: CGFloat = 1.0
    @State private var isPaused: Bool = false
    @State private var enemyHit: Bool = false
    @State private var showSoap: Bool = false
    @State private var soapPositionX: CGFloat = 0
    @State private var soapPositionY: CGFloat = 0
    @State private var playerPositionX: CGFloat = 0
    @State private var playerPositionY: CGFloat = 0
    @State private var gameWon: Bool = false
    @State private var homePage: Bool = false
    @State private var audioPlayer: AVAudioPlayer?
    @State private var clickAudioPlayer: AVAudioPlayer?
    @State private var throwAudioPlayer: AVAudioPlayer?
    @State private var hitAudioPlayer: AVAudioPlayer?

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    Image("fightBackground")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all) // Ensure it ignores safe area insets

                    GeometryReader { geometry in
                        VStack {
                            HStack {
                                Spacer()

                                HealthBar(health: enemyHealth)
                                    .frame(height: 20)
                                    .padding(.trailing, 20)
                                    .padding(.top, 40)

                                Button(action: {
                                    playClickSound() // Play click sound
                                    isPaused.toggle()
                                }) {
                                    Image(systemName: "pause.circle.fill")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .foregroundStyle(.white, .darkBlue)
                                        .padding(.trailing, 20)
                                        .padding(.top, 40)
                                }
                            }

                            Spacer()

                            // Main Fighting Area
                            HStack {
                                // Enemy Image
                                Image("germs")
                                    .resizable()
                                    .scaledToFit()
                                    .scaleEffect(x: -1, y: 1)
                                    .frame(width: 200, height: 200)
                                    .padding(.trailing, 50)
                                    .opacity(enemyHit ? 0.5 : 1)
                                    .animation(.easeInOut(duration: 0.3), value: enemyHit)

                                Spacer()
                                    .frame(width: 50)

                                // Player Image
                                Image("superherosoap")
                                    .resizable()
                                    .scaledToFit()
                                    .scaleEffect(x: -1, y: 1)
                                    .frame(width: 300, height: 250)
                                    .background(
                                        GeometryReader { playerGeo in
                                            Color.clear
                                                .onAppear {
                                                    let localFrame = playerGeo.frame(in: .local)
                                                    playerPositionX = localFrame.maxX - 100 // Position from the right side
                                                    playerPositionY = localFrame.midY + 50 // Adjust Y offset here
                                                }
                                        }
                                    )

                                // Throw Soap Button
                                Button(action: {
                                    throwSoap(geometry: geometry)
                                }) {
                                    Image(systemName: "wand.and.rays")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .foregroundColor(.black)
                                        .padding(.trailing, 30)
                                }
                            }
                            .padding(.top, 40)

                            Spacer()
                        }
                    }

                    // Soap Projectile Animation
                    if showSoap {
                        Image("soapProjectile")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .position(x: soapPositionX, y: soapPositionY + 50) // Added Y offset
                            .animation(.linear(duration: 0.5), value: soapPositionX)
                    }

                    // Pause Overlay
                    if isPaused {
                        Color.black.opacity(0.4)
                            .edgesIgnoringSafeArea(.all)
                            .onTapGesture {
                                isPaused = false
                            }

                        VStack(spacing: 20) {
                            Text("Game Paused")
                                .font(.custom("Vanilla", size: 36))
                                .foregroundColor(.darkBlue)

                            HStack(spacing: 40) {
                                // Home Button
                                  Button(action: {
                                      playClickSound() // Play click sound when the icon is tapped
                                      DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { // Delay for the click sound to play
                                          // Perform navigation here
                                          homePage = true // Set this to true to trigger navigation
                                      }
                                  }) {
                                      Image("houseicon")
                                          .resizable()
                                          .frame(width: 50, height: 50)
                                          .foregroundColor(.red)
                                  }

                                // Reset Button
                                Button(action: {
                                    playClickSound() // Play click sound
                                    enemyHealth = 1.0
                                    isPaused = false
                                }) {
                                    Image(systemName: "arrow.counterclockwise")
                                        .resizable()
                                        .frame(width: 40, height: 50)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(25)
                        .shadow(radius: 10)
                        .frame(maxWidth: .infinity, maxHeight: .infinity) // Make the overlay occupy full screen
                        .padding() // Add padding to keep the contents centered
                    }
                }
                .onAppear {
                    playBackgroundMusic()
                }
                .navigationDestination(isPresented: $gameWon) {
                    VictoryPage()
                        .navigationBarBackButtonHidden(true)
                }
                .navigationDestination(isPresented: $homePage) {
                    HomePage()
                        .navigationBarBackButtonHidden(true)
                }

            }
        }
    }

    // MARK: - Audio Functions

    private func playBackgroundMusic() {
        guard let url = Bundle.main.url(forResource: "backgroundMusic", withExtension: "mp3") else {
            print("Audio file not found")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1 // Loop indefinitely
            audioPlayer?.play()
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }

    private func playClickSound() {
        guard let url = Bundle.main.url(forResource: "click", withExtension: "mp3") else {
            print("Click audio file not found")
            return
        }

        do {
            clickAudioPlayer = try AVAudioPlayer(contentsOf: url)
            clickAudioPlayer?.play()
        } catch {
            print("Error playing click audio: \(error.localizedDescription)")
        }
    }

    private func playThrowSound() {
        guard let url = Bundle.main.url(forResource: "pow", withExtension: "mp3") else {
            print("Throw audio file not found")
            return
        }

        do {
            throwAudioPlayer = try AVAudioPlayer(contentsOf: url)
            throwAudioPlayer?.play()
        } catch {
            print("Error playing throw audio: \(error.localizedDescription)")
        }
    }

    private func playHitSound() {
        guard let url = Bundle.main.url(forResource: "ow", withExtension: "mp3") else {
            print("Hit audio file not found")
            return
        }

        do {
            hitAudioPlayer = try AVAudioPlayer(contentsOf: url)
            hitAudioPlayer?.play()
        } catch {
            print("Error playing hit audio: \(error.localizedDescription)")
        }
    }

    // MARK: - Game Functions

    func throwSoap(geometry: GeometryProxy) {
        // Set the soap position to the right side of the screen (adjust this as needed)
        soapPositionX = geometry.size.width - 50 // Starting position near the right edge
        soapPositionY = playerPositionY
        
        showSoap = true
        playThrowSound() // Play throw sound effect

        withAnimation(.linear(duration: 0.5)) {
            // Move the soap towards the left side of the screen
            soapPositionX = 50 // Adjust this value based on where you want it to hit the enemy
            soapPositionY = playerPositionY // Keep the Y position consistent with the player
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            // After the animation, reduce enemy health
            enemyHealth -= 0.3
            enemyHit = true
            showSoap = false
            
            // Reset soap position
            soapPositionX = playerPositionX
            playHitSound()  // Play hit sound effect

            if enemyHealth <= 0 {
                gameWon = true  // Trigger victory if health drops to zero
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                enemyHit = false
            }
        }
    }
}

// MARK: - HealthBar View

struct HealthBar: View {
    var health: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(height: 20)
                    .foregroundColor(.gray)
                    .animation(.easeInOut(duration: 0.3), value: health) // Add animation for health depletion

                Rectangle()
                    .frame(width: (geometry.size.width) * health, height: 20)
                    .foregroundColor(.green)
                    .animation(.easeInOut(duration: 0.3), value: health) // Add animation for health depletion
            }
            .cornerRadius(10)
        }
        .frame(maxWidth: .infinity) // Make the health bar occupy full width
    }
}

// MARK: - Preview

struct FightingPage_Previews: PreviewProvider {
    static var previews: some View {
        FightingPage()
    }
}
