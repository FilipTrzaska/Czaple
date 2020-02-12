//
//  BoardAudioPlayer.swift
//  Czaple
//
//  Created by Filip Trzaska on 05/12/2019.
//  Copyright © 2019 Filip Trzaska. All rights reserved.
//

import AVKit

protocol BoardAudioPlayerProtocol {
    func playRecording(board: Int, controller: AttractionView)
}

final class BoardAudioPlayer: BoardAudioPlayerProtocol {
    
    func playRecording(board: Int, controller: AttractionView) {
        guard let url = Bundle.main.url(forResource: "\(board + 1)", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            controller.player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = controller.player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
}
