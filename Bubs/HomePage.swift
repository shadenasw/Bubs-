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
                        Text("START")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.blue)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(15)
                            .scaleEffect(scale)
                            .shadow(radius: 10)
                    }
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.2).delay(0.2)) {
                            self.scale = 1.0
                        }
                    }
                    Text("BUBS")
                        .font(.system(size: 70, weight: .bold, design: .rounded))
                        .foregroundStyle(.blue)
                        .padding(.top,-180)
                }
            }
                .ignoresSafeArea()
            }
        }
#Preview {
    HomePage()
}
