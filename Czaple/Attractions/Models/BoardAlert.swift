//
//  BoardAlert.swift
//  Czaple
//
//  Created by Filip Trzaska on 05/12/2019.
//  Copyright © 2019 Filip Trzaska. All rights reserved.
//

import UIKit

protocol BoardAlerting {
    func boardAlertAction(controller: UIViewController)
}

final class BoardAlert: BoardAlerting {
    let boardProvider: BoardProviding
    let boardAudioPlayer: BoardAudioPlayerProtocol
    
    init(boardProvider: BoardProviding, boardAudioPlayer: BoardAudioPlayerProtocol) {
        self.boardProvider = boardProvider
        self.boardAudioPlayer = boardAudioPlayer
    }
    
    func boardAlertAction(controller: UIViewController) {
        let alertController = UIAlertController(title: NSLocalizedString("Opis której tablicy odtworzyć?", comment: ""), message: NSLocalizedString("Wybierz jedną, by kontynuować.", comment: ""), preferredStyle: .actionSheet)
        for board in 0...4 {
            alertController.addAction(UIAlertAction(title: boardProvider.getTablice()[board].name, style: .default, handler: { (action) in
                self.boardAudioPlayer.playRecording(board: board, controller: controller as! AttractionView)
            }))
        }
        let cancel = UIAlertAction(title: NSLocalizedString("Anuluj", comment: ""), style: .cancel, handler: nil)
        alertController.addAction(cancel)
        
        controller.present(alertController, animated: true, completion: nil)
    }
}
