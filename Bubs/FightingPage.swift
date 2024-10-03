//
//  FightingPage.swift
//  Bubs
//
//  Created by Haya Albaker on 29/09/2024.
//

import SwiftUI

struct FightingPage: View {
    @State private var enemyHealth: CGFloat = 1.0
    @State private var isPaused: Bool = false
    @State private var enemyHit: Bool = false
    @State private var showSoap: Bool = false  // track if soap is being thrown
    @State private var soapPositionX: CGFloat = 0
    @State private var soapPositionY: CGFloat = 0
    @State private var playerPositionX: CGFloat = 0
    @State private var playerPositionY: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background
                Image("fightBackground")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    // Health bar and pause button
                    HStack {
                        HealthBar(health: enemyHealth)
                            .frame(height: 20)
                            .padding(.leading, 20)
                            .padding(.top, 40)

                        // Pause Button
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
                            // Trigger soap
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
                            // player's position
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

                // Pause Menu Overlay
                if isPaused {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            isPaused = false
                        }

                    VStack(spacing: 20) {
                        Text("Game Paused")
                            .font(.system(size: 36, weight: .bold, design: .rounded))
                            .foregroundColor(.darkBlue)

                        HStack(spacing: 40) {
                            // Back to Levels button
                            Button(action: {
                                print("Back to Levels")
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
            }
        }
    }

    func throwSoap() {
        // soap projectile animation from the player's position
        soapPositionX = playerPositionX
        soapPositionY = playerPositionY
        showSoap = true
        
        // the soap towards the germ
        withAnimation(.linear(duration: 0.5)) {
            soapPositionX += 400  // Move the soap towards the right (near the enemy)
        }
        
        // Handle hit and reset soap after the animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            enemyHealth -= 0.3  // Decrease the enemy health by 30%
            enemyHit = true  // Trigger hit effect
            showSoap = false  // Hide the soap
            soapPositionX = playerPositionX  // Reset the soap position to the player
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                enemyHit = false  // Reset the hit effect
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
                    .frame(width: (geometry.size.width) * health, height: 20)  // Ensure correct width for health
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
