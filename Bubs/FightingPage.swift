//
//  FightingPage.swift
//  Bubs
//
//  Created by Haya Albaker on 29/09/2024.
//

import SwiftUI

struct FightingPage: View {
    @State private var enemyHealth: CGFloat = 1.0 // Initialize with full health
    @State private var isPaused: Bool = false // State for the pause menu

    var body: some View {
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

                        // Pause Button to toggle pause state
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

                    // Player and enemy characters
                    HStack {
                        Button(action: {
                            // Attack action
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
                            .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.3)

                        Spacer()
                            .frame(width: geometry.size.width * 0.1)

                        Image("germs")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 0.4, height: geometry.size.height * 0.3)
                            .padding(.trailing, 30)
                    }
                    .padding(.top, 80)

                    Spacer()
                }

                // Pause Menu Overlay
                if isPaused {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)

                    VStack(spacing: 20) {
                        Text("Game Paused")
                            .font(.system(size: 36, weight: .bold, design: .rounded))
                            .foregroundColor(.darkBlue)

                        HStack(spacing: 40) {
                            // Back to Levels button
                            Button(action: {
                                // Back to Levels
                                print("Back to Levels")
                                // Implement navigation to levels page
                            }) {
                                VStack {
                                    Image(systemName: "house.circle.fill")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.red)
                                }
                            }

                            // Retry button
                            Button(action: {
                                // Reset health and unpause
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

                        // Resume game by tapping the pause button again
                        Button(action: {
                            isPaused = false
                        }) {
                            Image(systemName: "play.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundStyle(.white, .darkBlue)
                                .shadow(radius: 5)
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(25)
                    .shadow(radius: 10)
                    .padding(.horizontal, 20) // Add some padding to keep it centered
                }
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
                    .frame(width: max((geometry.size.width - 40) * health, 0), height: 20)
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
