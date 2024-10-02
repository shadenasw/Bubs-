import SwiftUI

struct VictoryPage: View {
    @State private var levelsCompleted = 0 // Tracks completed levels
    private let totalLevels = 6 // Total number of levels
    
    // Computed property to check if all levels are completed
    var allLevelsCompleted: Bool {
        return levelsCompleted >= totalLevels
    }
    
    var body: some View {
        ZStack {
            // Background image
            Image("IMG_3451")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                // Victory text
                Text("You Won!")
                    .font(.system(size: 70, weight: .bold, design: .rounded))
                    .foregroundStyle(.darkBlue)
                    .padding(.top)
                 
                
                Spacer()
                
                // Conditionally display "Continue" button if all levels are not completed
                if !allLevelsCompleted {
                    Button(action: {
                        completeLevel() // Complete level locally for now
                    }) {
                        Text("Continue")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 200, height: 50)
                            .background(Color.darkBlue)
                            .cornerRadius(10)
                            .padding(.bottom, 20)
                    }
                }
                
                // Back button
                Button(action: {
                    // Action for "Back"
                }) {
                    Text("Back")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.darkBlue)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding(.bottom, 50)
        }
    }
    
    // Function to mark a level as completed locally in VictoryPage
    func completeLevel() {
        if levelsCompleted < totalLevels {
            levelsCompleted += 1
        }
        /*
         TODO: [For future linking with LevelPage]
         Once the game is linked with the LevelPage,
         we will modify this function to track the player's current level
         based on their progression from the LevelPage.
         
         Instead of locally managing 'levelsCompleted' here,
         we will fetch the current level from the LevelPage and
         update the player's progression based on where they are in the game.
         
         Example:
         - After linking, we might change 'levelsCompleted'
           to be passed in from LevelPage or a global game manager.
         - We will also update the continue button action to navigate
           the player to the next appropriate level.
         */
    }
}

#Preview {
    VictoryPage()
}
