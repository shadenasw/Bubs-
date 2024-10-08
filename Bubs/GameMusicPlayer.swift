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
    
    private var backgroundAudioPlayer: AVAudioPlayer?
    private var fightingAudioPlayer: AVAudioPlayer?
    
    private init() {
        loadBackgroundMusic("GameMusic")
        loadFightingMusic("fightMusic")
    }
    
    // Load background music
    func loadBackgroundMusic(_ filename: String) {
        if let url = Bundle.main.url(forResource: filename, withExtension: "mp3") {
            do {
                backgroundAudioPlayer = try AVAudioPlayer(contentsOf: url)
                backgroundAudioPlayer?.numberOfLoops = -1 // Loop indefinitely
            } catch {
                print("Error loading background music: \(error)")
            }
        } else {
            print("Background music file not found.")
        }
    }
    
    // Load fighting music
    private func loadFightingMusic(_ filename: String) {
        if let url = Bundle.main.url(forResource: filename, withExtension: "mp3") {
            do {
                fightingAudioPlayer = try AVAudioPlayer(contentsOf: url)
                fightingAudioPlayer?.numberOfLoops = -1 // Loop indefinitely
            } catch {
                print("Error loading fighting music: \(error)")
            }
        } else {
            print("Fighting music file not found.")
        }
    }

    // Start playing background music
    func playBackgroundMusic() {
        fightingAudioPlayer?.stop() // Stop fighting music if playing
        backgroundAudioPlayer?.play()
    }
    
    // Start playing fighting music
    func playFightingMusic() {
        backgroundAudioPlayer?.stop() // Stop background music if playing
        fightingAudioPlayer?.play()
    }
    
    // Stop all music
    func stop() {
        backgroundAudioPlayer?.stop()
        fightingAudioPlayer?.stop()
    }
    
    // Pause all music
    func pause() {
        backgroundAudioPlayer?.pause()
        fightingAudioPlayer?.pause()
    }
}
