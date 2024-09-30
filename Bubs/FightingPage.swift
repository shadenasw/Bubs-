//
//  FightingPage.swift
//  Bubs
//
//  Created by Haya Albaker on 29/09/2024.
//

import SwiftUI

struct FightingPage: View {
    @State private var playerHealth: CGFloat = 1.0
    @State private var enemyHealth: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            // background
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                // health bars
                HStack {
                    HealthBar(health: playerHealth)
                        .frame(width: 150, height: 20)
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                    HealthBar(health: enemyHealth)
                        .frame(width: 150, height: 20)
                        .padding(.trailing, 20)
                }
                .padding(.top, 40)
                
                Spacer()
                  //  .frame(height: 40)
                
                // player and germ
                HStack {
                    Button(action: {
                        // action
                    }) {
                        Image(systemName: "wand.and.stars")
                            .resizable()
                            .frame(width: 60, height: 60)
                    }
                    Image("supergirl")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 180)
                        .padding()
                    
                    Spacer()
                    
                    Image("germs")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .padding()
                }
                .padding(.top, 40)
                
                }
            }
        }
    }


// health bar view
struct HealthBar: View {
    var health: CGFloat
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: 150, height: 20)
                .foregroundColor(.gray)
            Rectangle()
                .frame(width: 150 * health, height: 20)
                .foregroundColor(.green)
        }
        .cornerRadius(10)
    }
}

struct FightingPage_Previews: PreviewProvider {
    static var previews: some View {
        FightingPage()
    }
}
