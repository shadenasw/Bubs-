import SwiftUI
import Kingfisher
import AVFoundation

struct LevelsPage: View {
    @State private var showHandImage = false
    @State private var currentLevel = 0
    @State private var audioPlayer: AVAudioPlayer?
    @State private var navigateToFightingPage = false // حالة الانتقال إلى صفحة القتال
    @State private var selectedLevel: Int? // مستوى مختار
    @State private var navigateToHomePage = false // حالة الانتقال إلى الصفحة الرئيسية

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
                    if let url = Bundle.main.url(forResource: "hand", withExtension: "png") {
                        KFImage(url)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .position(x: 200, y: 300)
                    } else {
                        Text("Unable to load image")
                            .foregroundColor(.red)
                    }
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
                NavigationLink(destination: HomePage(), isActive: $navigateToHomePage) {
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
        switch level {
        case 1:
            // الانتقال إلى المستوى 1
            selectedLevel = level
            currentLevel = 1
            navigateToFightingPage = true
        case 2:
            // الانتقال إلى المستوى 2 مع تشغيل الصوت
            playSound() // تشغيل الصوت عند النقر على زر 2
            selectedLevel = level
            currentLevel = 2
            
            // الانتقال بعد 4 ثوانٍ
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                navigateToFightingPage = true // الانتقال إلى صفحة القتال بعد 4 ثوانٍ
            }
        case 3:
            // الانتقال إلى المستوى 3
            selectedLevel = level
            currentLevel = 3
            navigateToFightingPage = true
        case 4:
            // الانتقال إلى المستوى 4 مع إظهار صورة اليد
            showHandImage = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                showHandImage = false // إخفاء صورة اليد بعد ثانية
            }
            selectedLevel = level
            currentLevel = 4
            navigateToFightingPage = true
        case 5:
            // الانتقال إلى المستوى 5
            selectedLevel = level
            currentLevel = 5
            navigateToFightingPage = true
        default:
            break
        }
    }

    // دالة لتشغيل الصوت
    func playSound() {
        do {
            // إعداد Audio Session
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            guard let url = Bundle.main.url(forResource: "hand-washing-8483", withExtension: "mp3") else {
                print("Audio file not found.")
                return
            }

            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay() // تحضير الصوت للتشغيل
            audioPlayer?.play()
            print("Playing sound")
        } catch {
            print("Error setting up audio session or playing sound: \(error.localizedDescription)")
        }
    }
}



