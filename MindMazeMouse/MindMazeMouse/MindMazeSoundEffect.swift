//
//  SoundEffect.swift
//  MindMazeMouse
//
//  Created by MindMazeMouse on 2024/12/25.
//


import Foundation
import AVFoundation

class MindMazeSoundEffect{
    
    var playSound: AVAudioPlayer?
    
    func useSounds(soundName: String) {
        guard let soundUrl = Bundle.main.url(forResource: soundName, withExtension: "mp3") else {
            print("Sound file not found")
            return
        }
        
        do {
            playSound = try AVAudioPlayer(contentsOf: soundUrl)
            playSound?.prepareToPlay()
            playSound?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
    
}
