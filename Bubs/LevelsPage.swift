import SwiftUI
import Kingfisher
import AVFoundation
//import SwiftGifOrigin // تأكد من استيراد مكتبة SwiftGif


struct LevelsPage: View {
   
    
    @State private var showHandImage = false
    @State private var audioPlayer: AVAudioPlayer?
    @State private var navigateToFightingPage = false // حالة الانتقال إلى صفحة القتال
    @State private var navigateToHomePage = false // حالة الانتقال إلى الصفحة الرئيسية
//    @State private var currentLevel = 1// مستوى اللاعب
    //@State  var currentLevel: [Bool] = [true, false, false, false, false]
    @State var levelsCompleted = 0
    @EnvironmentObject var vm: ViewModel

    
    
    var body: some View {
        NavigationView {
            ZStack {
                // خلفية الصورة
                Image("sink")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()

                // عرض صورة اليد عند النقر
                if showHandImage {
//                    if let url = Bundle.main.url(forResource: "handLevel1", withExtension: "png") {
                        //KFImage(url)
                    Image(.handLevel1)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .position(x: 200, y: 300)
//                    } else {
//                        Text("Unable to load image")
//                            .foregroundColor(.red)
//                            .font(.largeTitle)
//                    }
                }

                // أزرار المستويات
                ZStack {
                    // زر المستوى 1
                    Button(action: {
                        levelSelected(1)
                    }) {
                        Text("1")
                            .font(.custom("Vanilla", size: 20))
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(vm.levelsArray[0] ? Color.darkBlue : Color.gray)
                            .clipShape(Circle())
                    }
                    .position(x: 120, y: 340)

                    // زر المستوى 2
                    Button(action: {
                        levelSelected(2)
                    }) {
                        Text("2")
                            .font(.custom("Vanilla", size: 30))
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(vm.levelsArray[1] ? Color.darkBlue : Color.gray)
                            .clipShape(Circle())
                    }
                    .position(x: 360, y: 80)
                    .disabled(!vm.levelsArray[1])

                    // زر المستوى 3
                    Button(action: {
                        levelSelected(3)
                    }) {
                        Text("3")
                        .font(.custom("Vanilla", size: 30))
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(vm.levelsArray[2] ? Color.darkBlue : Color.gray)
                            .clipShape(Circle())
                    }
                    .position(x: 220, y: 130)
                    .disabled(!vm.levelsArray[2])

                    // زر المستوى 4
                    Button(action: {
                        levelSelected(4)
                    }) {
                        Text("4")
                            .font(.custom("Vanilla", size: 30))
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(vm.levelsArray[3] ? Color.darkBlue : Color.gray)
                            .clipShape(Circle())
                    }
                    .position(x: 370, y: 310)
                    .disabled(!vm.levelsArray[3] )

                    // زر المستوى 5
                    Button(action: {
                        levelSelected(5)
                    }) {
                        Text("5")
                        .font(.custom("Vanilla", size: 30))
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(vm.levelsArray[4] ? Color.darkBlue : Color.gray)
                            .clipShape(Circle())
                    }
                    .position(x: 540, y: 150)
                    .disabled(!vm.levelsArray[4])
                }

                // أيقونة المنزل
                NavigationLink(destination: HomePage().navigationBarBackButtonHidden(true), isActive: $navigateToHomePage) {
                    Image(systemName: "house.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 70, height: 50)
                        .background(Color.darkBlue)
                        .clipShape(Circle())
                        .padding(.top)
                }
                .position(x: 50, y: 50)

                // الانتقال إلى صفحة القتال
                NavigationLink(destination: FightingPage(currentLevel: $vm.levelsArray, levelsCompleted: $levelsCompleted)
                    .navigationBarBackButtonHidden(true), isActive: $navigateToFightingPage) {
                    EmptyView()
                }
            }
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
            // الانتقال إلى المستوى 1 مع إظهار صورة اليد
            showHandImage = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                showHandImage = false // إخفاء صورة اليد بعد 4 ثوان
                if vm.levelsArray[0] {
                                   navigateToFightingPage = true
                               } // الانتقال إلى صفحة القتال
            }
            
            
        case 2:
            // الانتقال إلى المستوى 2 مع تشغيل صوت غسل اليد
            playSound() // تشغيل الصوت عند النقر على زر 2
            showHandImage = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                showHandImage = false // إخفاء صورة اليد بعد 4 ثوان
                if vm.levelsArray[1] {
                                   navigateToFightingPage = true
                               } // الانتقال إلى صفحة القتال بعد 4 ثوان
            }
           
        case 3:
            
            if vm.levelsArray[2] {
                            navigateToFightingPage = true
                        }
        case 4:
           
            if vm.levelsArray[3] {
                           navigateToFightingPage = true
                       }
        case 5:
            if vm.levelsArray[4] {
                          navigateToFightingPage = true
                      }        default:
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

#Preview {
    LevelsPage()
}



/*
import SwiftUI
import Kingfisher
import AVFoundation
import SwiftGifOrigin // تأكد من استيراد مكتبة SwiftGif

struct LevelsPage: View {
    
    @State private var showHandImage = false // حالة لعرض صورة اليد
    @State private var showGIF = false // حالة لعرض صورة GIF
    @State private var audioPlayer: AVAudioPlayer? // مشغل الصوت
    @State private var navigateToFightingPage = false // حالة الانتقال إلى صفحة القتال
    @State private var navigateToHomePage = false // حالة الانتقال إلى الصفحة الرئيسية

    @State var currentLevel: [Bool] = [true, false, false, false, false] // مستوى اللاعب
    @State var levelsCompleted = 0 // عدد المستويات المكتملة
    @EnvironmentObject var vm: ViewModel // نموذج العرض
    
    var body: some View {
        NavigationView {
            ZStack {
                // خلفية الصورة
                Image("sink")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()

                // عرض صورة اليد عند النقر
                if showHandImage {
                    Image("handLevel1") // تأكد من وجود الصورة في المشروع
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .position(x: 200, y: 300)
                }

                // عرض صورة GIF عند النقر على الرقم 4
                if showGIF {
                    GIFImage("wash") // استبدل "wash" باسم ملف GIF الخاص بك
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .position(x: 200, y: 300)
                }

                // أزرار المستويات
                ZStack {
                    // زر المستوى 1
                    Button(action: {
                        levelSelected(1) // استدعاء دالة المستوى
                    }) {
                        Text("1")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(currentLevel[0] ? Color.blue : Color.gray)
                            .clipShape(Circle())
                    }
                    .position(x: 120, y: 340)

                    // زر المستوى 2
                    Button(action: {
                        levelSelected(2) // استدعاء دالة المستوى
                    }) {
                        Text("2")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(currentLevel[1] ? Color.blue : Color.gray)
                            .clipShape(Circle())
                    }
                    .position(x: 360, y: 80)
                    .disabled(!currentLevel[1]) // تعطيل الزر إذا لم يتم فتح المستوى

                    // زر المستوى 3
                    Button(action: {
                        levelSelected(3) // استدعاء دالة المستوى
                    }) {
                        Text("3")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(currentLevel[2] ? Color.blue : Color.gray)
                            .clipShape(Circle())
                    }
                    .position(x: 220, y: 130)
                    .disabled(!currentLevel[2]) // تعطيل الزر إذا لم يتم فتح المستوى

                    // زر المستوى 4
                    Button(action: {
                        levelSelected(4) // استدعاء دالة المستوى
                    }) {
                        Text("4")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(currentLevel[3] ? Color.blue : Color.gray)
                            .clipShape(Circle())
                    }
                    .position(x: 370, y: 310)
                    .disabled(!currentLevel[3]) // تعطيل الزر إذا لم يتم فتح المستوى

                    // زر المستوى 5
                    Button(action: {
                        levelSelected(5) // استدعاء دالة المستوى
                    }) {
                        Text("5")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .background(currentLevel[4] ? Color.blue : Color.gray)
                            .clipShape(Circle())
                    }
                    .position(x: 540, y: 150)
                    .disabled(!currentLevel[4]) // تعطيل الزر إذا لم يتم فتح المستوى
                }

                // أيقونة المنزل
                NavigationLink(destination: HomePage().navigationBarBackButtonHidden(true), isActive: $navigateToHomePage) {
                    Image(systemName: "house.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .frame(width: 70, height: 50)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .padding(.top)
                }
                .position(x: 50, y: 50)

                // الانتقال إلى صفحة القتال
                NavigationLink(destination: FightingPage(currentLevel: $currentLevel, levelsCompleted: $levelsCompleted)
                    .navigationBarBackButtonHidden(true), isActive: $navigateToFightingPage) {
                    EmptyView()
                }
            }
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
            // الانتقال إلى المستوى 1 مع إظهار صورة اليد
            showHandImage = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                showHandImage = false // إخفاء صورة اليد بعد 4 ثوان
                navigateToFightingPage = currentLevel[0] // الانتقال إلى صفحة القتال
            }

        case 2:
            // الانتقال إلى المستوى 2 مع تشغيل صوت غسل اليد
            playSound() // تشغيل الصوت عند النقر على زر 2
            showHandImage = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                showHandImage = false // إخفاء صورة اليد بعد 4 ثوان
                navigateToFightingPage = currentLevel[1] // الانتقال إلى صفحة القتال بعد 4 ثوان
            }

        case 3:
            // الانتقال إلى المستوى 3 بعد ثانية واحدة
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                navigateToFightingPage = currentLevel[2]
            }

        case 4:
            // الانتقال إلى المستوى 4 وعرض GIF
            showGIF = true // إظهار صورة GIF
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                showGIF = false // إخفاء صورة GIF بعد 4 ثوان
                navigateToFightingPage = currentLevel[3]
            }

        case 5:
            // الانتقال إلى المستوى 5 بعد ثانية واحدة
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                navigateToFightingPage = currentLevel[4]
            }

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

// علامة مخصصة لعرض صورة GIF
struct GIFImage: UIViewRepresentable {
    var name: String

    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage.gif(name: name) // استخدام المكتبة لتحميل GIF
        return imageView
    }

    func updateUIView(_ uiView: UIImageView, context: Context) {}
}

#Preview {
    LevelsPage()
}
*/
