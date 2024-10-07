//
//  GameMusicPlayer.swift
//  Bubs
//
//  Created by Haya Albaker on 07/10/2024.
//

import Foundation
import AVFoundation

class GameMusicPlayer {
    static let shared = GameMusicPlayer() // Singleton instance
    
    private var audioPlayer: AVAudioPlayer?
    
    private init() {
        // Load and prepare the music files
        loadBackgroundMusic("GameMusic") // Regular game music
        loadFightingMusic("fightingMusic") // Fighting music
    }
    
    func loadBackgroundMusic(_ filename: String) {
        if let url = Bundle.main.url(forResource: filename, withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.numberOfLoops = -1 // Infinite loop
            } catch {
                print("Error loading background music: \(error)")
            }
        }
    }
    
    private func loadFightingMusic(_ filename: String) {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "mp3") else {
            print("Fighting music file not found.")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1 // Infinite loop for fighting music
        } catch {
            print("Error loading fighting music: \(error)")
        }
    }

    
    // Start playing the music
    func playBackgroundMusic() {
        audioPlayer?.play()
    }
    
    // Start playing the fighting music
    func playFightingMusic() {
        audioPlayer?.play() // Ensure that you switch to the fighting music here
    }
    
    // Stop the music
    func stop() {
        audioPlayer?.stop()
    }
    
    // Pause the music
    func pause() {
        audioPlayer?.pause()
    }
}
