//
//  AudioManager.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Er Baghdasaryan on 27.10.23.
//

import Foundation
import AVFoundation

class AudioManager {
    
    public var audioPlayer: AVAudioPlayer?

    init(for resource: String, with extensionn: String) {
        if let audioURL = Bundle.main.url(forResource: resource, withExtension: extensionn) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
            } catch {
                fatalError()
            }
        }
    }
    
    deinit {
        audioPlayer?.stop()
        audioPlayer = nil
    }
}

