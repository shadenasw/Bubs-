import SwiftUI
import Kingfisher
import AVFoundation

struct LevelsPage: View {
    @State private var showHandImage = false
    @State private var showGif = false
    @State private var currentLevel = 0
    @State private var audioPlayer: AVAudioPlayer?
    @State private var navigateToFightingPage = false // حالة الانتقال

    var body: some View {
        NavigationView {
            ZStack {
                // خلفية الصورة
                Image("sink")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()

                // عرض الـ GIF في الأعلى إذا كانت الحالة true
                if showGif {
                    if let url = Bundle.main.url(forResource: "wash", withExtension: "gif") {
                        KFImage(url)
                            .resizable()
                            .scaledToFit()
                            .padding(10)
                            .position(x: 370, y: 310)
                    } else {
                        Text("Unable to load GIF")
                            .foregroundColor(.red)
                    }
                }

                // عرض صورة اليد عند النقر على زر المستوى 1
                if showHandImage {
                    Image("hand")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .position(x: 200, y: 300)
                }

                // أزرار المستويات
                ZStack {
                    // زر المستوى 1
                    Button(action: {
                        levelSelected(1)
                    }) {
                        Text("1")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(Color.darkBlue)
                            .clipShape(Circle())
                    }
                    .position(x: 120, y: 340)

                    // زر المستوى 2
                    Button(action: {
                        levelSelected(2)
                    }) {
                        Text("2")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(currentLevel >= 1 ? Color.darkBlue : Color.gray)
                            .clipShape(Circle())
                    }
                    .position(x: 360, y: 80)
                    .disabled(currentLevel < 1)

                    // زر المستوى 3
                    Button(action: {
                        levelSelected(3)
                    }) {
                        Text("3")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(currentLevel >= 2 ? Color.darkBlue : Color.gray)
                            .clipShape(Circle())
                    }
                    .position(x: 220, y: 130)
                    .disabled(currentLevel < 2)

                    // زر المستوى 4
                    Button(action: {
                        levelSelected(4)
                    }) {
                        Text("4")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(currentLevel >= 3 ? Color.darkBlue : Color.gray)
                            .clipShape(Circle())
                    }
                    .position(x: 370, y: 310)
                    .disabled(currentLevel < 3)

                    // زر المستوى 5
                    Button(action: {
                        levelSelected(5)
                    }) {
                        Text("5")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(currentLevel >= 4 ? Color.darkBlue : Color.gray)
                            .clipShape(Circle())
                    }
                    .position(x: 540, y: 150)
                    .disabled(currentLevel < 4)
                }

                // ايقونة house.fill
                Button(action: {
                    print("house ")
                }) {
                    Image(systemName: "house.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 70, height: 50)
                        .background(Color.darkBlue)
                        .clipShape(Circle())
                        .padding(.top)
                }
                .position(x: 50, y: 50)
            }
            .background(
                NavigationLink(destination: FightingPage().navigationBarBackButtonHidden(true), isActive: $navigateToFightingPage) {
                    EmptyView()
                }
            )
        }
    }

    // دالة للتعامل مع ضغط الأزرار
    func levelSelected(_ level: Int) {
        if level == 1 {
            playSound() // تشغيل الصوت عند النقر على زر 1
            showGif.toggle() // تغيير حالة الـ GIF عند النقر على زر المستوى 1
            showHandImage = true // إظهار صورة اليد عند النقر على زر 1
            currentLevel = 1 // تحديث الرقم الحالي
            
            // الانتقال بعد 10 ثوانٍ
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                showHandImage = false // إخفاء صورة اليد
                navigateToFightingPage = true // الانتقال إلى صفحة القتال
            }
        } else if level <= 5 {
            currentLevel = level // تحديث الرقم الحالي
            print("Level \(level) selected")
        }
    }

    // دالة لتشغيل الصوت
    func playSound() {
        guard let url = Bundle.main.url(forResource: "hand-washing-8483", withExtension: "mp3") else {
            print("Audio file not found.")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}



#Preview {
    LevelsPage()
}
