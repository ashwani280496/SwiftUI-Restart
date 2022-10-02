//
//  AudioPlayer.swift
//  Restart
//
//  Created by Ashwani Kumar on 02/10/22.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playAudio(sound: String, type: String) {
    if let path  = Bundle.main.url(forResource: sound, withExtension: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: path)
            audioPlayer?.play()
        } catch {
            print("could not play audio")
        }
    }
}
