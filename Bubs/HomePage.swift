//
//  HomePage.swift
//  Bubs
//
//  Created by Ranad aldawood on 27/03/1446 AH.
//

import SwiftUI

struct HomePage: View {
    @State private var scale: CGFloat = 1.0
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
                        }
                    }
                    
                    Text("BUBS")
                        .font(.system(size: 70, weight: .bold, design: .rounded))
                        .italic()
                        .foregroundStyle(.blue)
                        .shadow(color: .cyan, radius: 2, x: 10, y: 10)
                        .rotationEffect(.degrees(10))
                        .padding(.top, -190)
                }
            }
        }
    }
}

#Preview {
    HomePage()
}
