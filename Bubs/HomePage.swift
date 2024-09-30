//
//  HomePage.swift
//  Bubs
//
//  Created by Ranad aldawood on 27/03/1446 AH.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        ZStack{
            Image("IMG_3451")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        
            Text("BUBS")
                .font(.system(size: 70, weight: .bold, design: .rounded))
                .foregroundStyle(.blue)
                .padding(.top,-180)
            
            Image(systemName: "play.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(.blue)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomePage()
}
