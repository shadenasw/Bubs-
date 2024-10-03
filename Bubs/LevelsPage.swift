//
//  LevelsPage.swift
//  Bubs
//
//  Created by Wasan Aljohani on 27/03/1446 AH.
//

//  LevelsPage.swift
//  Bubs
//
//  Created by Wasan Aljohani on 27/03/1446 AH.
//
import SwiftUI

struct LevelsPage: View {
    var body: some View {
        ZStack {
            // Background image (the sink)
            Image("sink") // The image name provided for the background
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            // Overlay buttons on the image based on red dot locations
            ZStack {
                // Button for Level 1
                Button(action: {
                    // Action to navigate to Level 1
                    levelSelected(1)
                }) {
                    Text("1")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(Color.darkBlue)
                        .clipShape(Circle())
                }
                .position(x: 120, y: 340) // Adjust these coordinates based on your layout
                
                // Button for Level 2
                Button(action: {
                    // Action to navigate to Level 2
                    levelSelected(2)
                }) {
                    Text("2")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(Color.darkBlue)
                        .clipShape(Circle())
                }
                .position(x: 360, y: 80) // Adjust these coordinates based on your layout
                
                // Button for Level 3
                Button(action: {
                    // Action to navigate to Level 3
                    levelSelected(3)
                }) {
                    Text("3")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(Color.darkBlue)
                        .clipShape(Circle())
                }
                .position(x: 220, y: 130) // Adjust these coordinates based on your layout
                
                // Button for Level 4
                Button(action: {
                    // Action to navigate to Level 4
                    levelSelected(4)
                }) {
                    Text("4")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(Color.darkBlue)
                        .clipShape(Circle())
                }
                .position(x: 370, y: 310) // Adjust these coordinates based on your layout
                
                // Button for Level 5
                Button(action: {
                    // Action to navigate to Level 5
                    levelSelected(5)
                }) {
                    Text("5")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(Color.darkBlue)
                        .clipShape(Circle())
                }
                .position(x: 540, y: 150) // Adjust these coordinates based on your layout
            }
        }
    }
    
    // Function to handle button actions
    func levelSelected(_ level: Int) {
        // Here you can handle navigation or specific level-related logic
        print("Level \(level) selected")
        // Add your game logic or navigation logic here
        // For example, you can navigate to the specific level's view or start the game
    }
}

#Preview {
    LevelsPage()
}
