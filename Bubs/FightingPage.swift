//
//  FightingPage.swift
//  Bubs
//
//  Created by Haya Albaker on 29/09/2024.
//

import SwiftUI

struct FightingPage: View {
   
    var body: some View {
        ZStack {
            // background
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                //  bars
                HStack {
                   
                }
                .padding(.top, 20)
                
                Spacer()
                
                // Player and enemy
                HStack {
                    Image("supergirl")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                    Image("germs")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding(.trailing, 20)
                }
                .padding(.top, 90)
                Spacer()
                
                // Controls and action buttons
                HStack {
                    // Action button (attack)
                    Button(action: {}) {
                        Image(systemName: "wand.and.stars")
                            .resizable()
                            .frame(width: 60, height: 60)
                    }
                    .padding(.leading, 50)
                    
                    Spacer()
                    
                    VStack(spacing: 10) {
                        Button(action: {}) {
                            Image(systemName: "arrow.up.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                        HStack(spacing: 10) {
                            Button(action: {}) {
                                Image(systemName: "arrow.left.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                            Button(action: {}) {
                                Image(systemName: "arrow.right.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                            }
                        }
                        Button(action: {}) {
                            Image(systemName: "arrow.down.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                    }
                    .padding(.trailing, 50)
                }
                .padding(.bottom, 30)
            }
        }
    }
}




#Preview {
    FightingPage()
    }

