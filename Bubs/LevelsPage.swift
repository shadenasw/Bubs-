import SwiftUI
import Kingfisher
import AVFoundation

struct LevelsPage: View {
    @State private var showHandImage = false
    @State private var currentLevel = 0
    @State private var audioPlayer: AVAudioPlayer?
    @State private var navigateToFightingPage = false // حالة الانتقال إلى صفحة القتال
    @State private var selectedLevel: Int? // مستوى مختار

    var body: some View {
        NavigationView {
            ZStack {
                // خلفية الصورة
                Image("sink")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()

                // عرض صورة اليد عند النقر على زر المستوى 4
                if showHandImage {
                    Image("wash") // تأكد من وجود صورة wash.png في مشروعك
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .position(x: 200, y: 300) // موقع الصورة
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
                        if currentLevel >= 1 {
                            levelSelected(2)
                        }
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
                        if currentLevel >= 2 {
                            levelSelected(3)
                        }
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
                        if currentLevel >= 3 {
                            levelSelected(4)
                        }
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
                        if currentLevel >= 4 {
                            levelSelected(5)
                        }
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

                // رابط للانتقال إلى الصفحة الرئيسية
                NavigationLink(destination: HomePage()) {
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
                NavigationLink(destination: FightingPage(), isActive: $navigateToFightingPage) {
                    EmptyView()
                }
            )
            .onAppear {
                // إعادة تعيين الحالة عند ظهور الصفحة
                navigateToFightingPage = false
            }
        }
    }

    // دالة للتعامل مع ضغط الأزرار
    func levelSelected(_ level: Int) {
        if level == 1 {
            // الانتقال إلى المستوى 1
            selectedLevel = level
            currentLevel = 1
            navigateToFightingPage = true
        } else if level == 2 {
            // الانتقال إلى المستوى 2 مع تشغيل الصوت
            playSound() // تشغيل الصوت عند النقر على زر 2
            selectedLevel = level
            currentLevel = 2
            
            // الانتقال بعد 5 ثوانٍ
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                navigateToFightingPage = true // الانتقال إلى صفحة القتال بعد 5 ثوانٍ
            }
        } else if level == 3 {
            // الانتقال إلى المستوى 3
            selectedLevel = level
            currentLevel = 3
            navigateToFightingPage = true
        } else if level == 4 {
            // الانتقال إلى المستوى 4 مع إظهار صورة اليد
            showHandImage = true
            
            // الانتقال بعد 4 ثوانٍ
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                showHandImage = false // إخفاء صورة اليد بعد الانتقال
                navigateToFightingPage = true // الانتقال إلى صفحة القتال بعد 4 ثوانٍ
            }
            selectedLevel = level
            currentLevel = 4
        } else if level == 5 {
            // الانتقال إلى المستوى 5
            selectedLevel = level
            currentLevel = 5
            navigateToFightingPage = true
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
