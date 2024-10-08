import SwiftUI

struct VictoryPage: View {
    @Binding var levelsCompleted: Int
    @Binding var currentLevel: [Bool]

    // Local mutable copy of the current level
    @State private var localCurrentLevel: [Bool] = []

    // Computed property to check if all levels are completed
    var allLevelsCompleted: Bool {
        return !localCurrentLevel.contains(true)
    }
    @State var shouldNavigate: Bool = false
    @EnvironmentObject var vm : ViewModel

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
                        .foregroundStyle(.darkBlue)
                        .padding(.top)

                    Spacer()

                    // "Continue" button opens next level
                    if !allLevelsCompleted {
                        
//                        NavigationLink(value: true) {
//
//                        }
//
//                        NavigationLink{
//                            Text("Continue")
//                                .font(.headline)
//                                .foregroundColor(.white)
//                                .frame(width: 200, height: 50)
//                                .background(Color.darkBlue)
//                                .cornerRadius(10)
//                                .padding(.bottom, 20)
//                        }
                        
                        
//                        Button(action: {
////                            levelsCompleted += 1
////                            currentLevel[levelsCompleted] = true
//                            /*updateNextLevel()*/ // Call the function to update levels
//                            vm.levelsArray[1] = true
//
//                        }) {
                            NavigationLink(destination: LevelsPage()){
                                Text("Continue")
                                .font(.custom("Vanilla", size: 30))
                                    .foregroundColor(.white)
                                    .frame(width: 200, height: 50)
                                    .background(Color.darkBlue)
                                    .cornerRadius(10)
                                    .padding(.bottom, 20)
                            }
                        }
                   // }

                    // "Back" button navigates to HomePage
                    NavigationLink(destination: HomePage().navigationBarBackButtonHidden(true)) {
                        Text("Back")
                            .font(.custom("Vanilla",size: 30))
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
        .onAppear {
            localCurrentLevel = currentLevel // Copy the current level to the local state
        }
    }

    // Function to update the next level
    func updateNextLevel() {
        for i in 0..<localCurrentLevel.count {
            if !localCurrentLevel[i] {
                localCurrentLevel[i] = true
                break
            }
        }
    }
}
