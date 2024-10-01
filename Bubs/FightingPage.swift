//
//  FightingPage.swift
//  Bubs
//
//  Created by Haya Albaker on 29/09/2024.
//

import SwiftUI

struct FightingPage: View {
    @State private var enemyHealth: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            // Background
            Image("fightBackground")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Health bar
                HStack {
                    HealthBar(health: enemyHealth)
                        .frame(height: 20)
                        .padding(.horizontal, 20)
                        .padding(.top, 20)

                }
                
                Spacer()
                
                // Player and enemy
                HStack {
                    VStack{ Button(action: {
                        // Attack action
                    }) {
                        Image(systemName: "wand.and.rays")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.black)
                            .scaleEffect(x: -1, y: 1)

                    }}
                        
                        Image("superherosoap")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)

                        Spacer()
                            .frame(width: 200)
                        Image("germs")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 300)
                    }
                .offset(y: 50)

                        
                        
                    }
                }
            }
        }
        
        struct HealthBar: View {
            var health: CGFloat
            
            var body: some View {
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        // Gray bar
                        Rectangle()
                            .frame(height: 20)
                            .foregroundColor(.gray)
                        
                        // Green bar
                        Rectangle()
                        //      .frame(width: max((geometry.size.width - 40) * health, 0), height: 20)
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
        
