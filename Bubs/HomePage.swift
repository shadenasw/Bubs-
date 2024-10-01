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
            ZStack{
                Image("IMG_3451")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                VStack{
                    Button(action:{
                        print("play button pressed")
                    }){
                       ( Image(systemName: "play.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:100, height: 100)
                            .ignoresSafeArea())
                            
                    }
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.2).delay(0.2)) {
                            self.scale = 1.0
                        }
                    }
                    Text("BUBS")
                        .font(.system(size: 70, weight: .bold, design: .rounded))
                        .italic()
                        .foregroundStyle(.blue)
                        .shadow(color: .cyan, radius: 2, x:10, y:10)
                        .rotationEffect(.degrees(10))
                        .padding(.top,-240)
                }
            }
                .ignoresSafeArea()
            }
        }
#Preview {
    HomePage()
}
