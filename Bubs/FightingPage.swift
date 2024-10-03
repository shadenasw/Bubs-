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
    @State private var navigationPath = NavigationPath()
    @State private var audioPlayer: AVAudioPlayer?

    init() {
        playBackgroundMusic()
    }

    private func playBackgroundMusic() {
        guard let url = Bundle.main.url(forResource: "soapBubbles", withExtension: "mp3") else {
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

    var body: some View {
        NavigationStack(path: $navigationPath) {
            GeometryReader { geometry in
                ZStack {
                    Image("fightBackground")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)

                    VStack {
                        HStack {
                            HealthBar(health: enemyHealth)
                                .frame(height: 20)
                                .padding(.leading, 20)
                                .padding(.top, 40)

                            Button(action: {
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

                        HStack {
                            Button(action: {
                                throwSoap()
                            }) {
                                Image(systemName: "wand.and.rays")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.black)
                                    .scaleEffect(x: -1, y: 1)
                                    .padding(.leading, 30)
                            }

                            Image("superherosoap")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 250)
                                .padding(.trailing, 50)
                                .background(
                                    GeometryReader { playerGeo in
                                        Color.clear
                                            .onAppear {
                                                playerPositionX = playerGeo.frame(in: .global).midX
                                                playerPositionY = playerGeo.frame(in: .global).midY
                                            }
                                    }
                                )

                            Spacer()
                                .frame(width: 110)

                            Image("germs")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                                .padding(.trailing, 50)
                                .opacity(enemyHit ? 0.5 : 1)
                                .animation(.easeInOut(duration: 0.3), value: enemyHit)
                        }
                        .padding(.top, 40)

                        Spacer()
                    }

                    if showSoap {
                        Image("soapProjectile")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .position(x: soapPositionX, y: soapPositionY)
                            .animation(.linear(duration: 0.5), value: soapPositionX)
                    }

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
                                Button(action: {
                                    // Navigate back to HomePage
                                    navigationPath.removeLast(navigationPath.count)
                                }) {
                                    VStack {
                                        Image(systemName: "house.circle.fill")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(.red)
                                    }
                                }

                                Button(action: {
                                    enemyHealth = 1.0
                                    isPaused = false
                                }) {
                                    VStack {
                                        Image(systemName: "arrow.counterclockwise.circle.fill")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(.green)
                                    }
                                }
                            }
                        }
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(25)
                        .shadow(radius: 10)
                        .padding(.horizontal, 20)
                    }

                    // Navigate to VictoryPage when gameWon is true
                    if gameWon {
                        NavigationLink(destination: VictoryPage(), isActive: $gameWon) {
                            EmptyView()
                        }
                    }
                }
            }
            .navigationDestination(for: String.self) { value in
                if value == "VictoryPage" {
                    VictoryPage()
                }
            }
        }
    }

    func throwSoap() {
        soapPositionX = playerPositionX
        soapPositionY = playerPositionY
        showSoap = true

        withAnimation(.linear(duration: 0.5)) {
            soapPositionX += 400
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            enemyHealth -= 0.3
            enemyHit = true
            showSoap = false
            soapPositionX = playerPositionX
            if enemyHealth <= 0 {
                gameWon = true  // Trigger victory if health drops to zero
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                enemyHit = false
            }
        }
    }
}

struct HealthBar: View {
    var health: CGFloat

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(height: 20)
                    .foregroundColor(.gray)

                Rectangle()
                    .frame(width: (geometry.size.width) * health, height: 20)
                    .foregroundColor(.green)
            }
            .cornerRadius(10)
        }
        .padding(.horizontal, 20)
    }
}

struct FightingPage_Previews: PreviewProvider {
    static var previews: some View {
        FightingPage()
    }
}
