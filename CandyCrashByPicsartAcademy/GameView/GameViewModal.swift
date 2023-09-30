//
//  GameViewModal.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 26.09.23.
//

import Foundation

final class GameViewModal {
    private(set) var gameEngine: GameEngine
    private let gameEngineBoardMeneger = GameEngineBoardMeneger(numberOfItemsInRow: 5,
                                                                boardSize: 40)
    
    var reloadItem: (([IndexPath]) -> Void)?
    
    init() {
        gameEngine = GameEngine(gameBoardMeneger: gameEngineBoardMeneger)
        gameEngine.gameBoardMeneger.createBoard()
        hendlerDefinitons()
    }
    
    private func hendlerDefinitons() {
        gameEngine.gameEngineBoardHendler.fallDownHendler = { indexPaths in
            self.reloadItem?(indexPaths)
        }
    }
}
