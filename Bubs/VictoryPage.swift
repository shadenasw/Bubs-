import SwiftUI
import AVFoundation


struct VictoryPage: View {
    @State private var levelsCompleted = 0 // Tracks completed levels
    private let totalLevels = 6 // Total number of levels
    
    // Computed property to check if all levels are completed
    var allLevelsCompleted: Bool {
        return levelsCompleted >= totalLevels
    }
    
    var body: some View {
        NavigationView {
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
                        .font(.custom("Vanilla", size: 70))
                        .font(.system(size: 70, weight: .bold, design: .rounded))
                        .font(.custom("Vanilla", size: 70))

                        .foregroundStyle(.darkBlue)
                        .padding(.top)
                    
                    Spacer()
                    
                    // "Continue" button navigates to LevelsPage
                    if !allLevelsCompleted {
                        NavigationLink(destination: LevelsPage().navigationBarBackButtonHidden(true)) {
                            Text("Continue")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 200, height: 50)
                                .background(Color.darkBlue)
                                .cornerRadius(10)
                                .padding(.bottom, 20)
                        }
                    }
                    
                    // "Back" button navigates to HomePage
                    NavigationLink(destination: HomePage().navigationBarBackButtonHidden(true)) {
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
                
            }.onAppear {
                GameMusicPlayer.shared.playBackgroundMusic() // Start playing background music
            }

        }
    }
}


// Preview
struct VictoryPage_Previews: PreviewProvider {
    static var previews: some View {
        VictoryPage()
    }
}

