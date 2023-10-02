//
//  GameViewModal.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 26.09.23.
//

import Foundation

final class GameViewModal {
    private(set) var gameEngine: GameEngine
    private let gameEngineBoardManager = GameEngineBoardManager(numberOfItemsInRow: 5,
                                                                boardSize: 40)
    
    var reloadItem: (([IndexPath]) -> Void)?
    
    init() {
        gameEngine = GameEngine(gameBoardManager: gameEngineBoardManager)
        gameEngine.gameBoardManager.createBoard()
        hendlerDefinitons()
    }
    
    private func hendlerDefinitons() {
        gameEngine.gameEngineBoardHandler.fallDownHandler = { indexPaths in
            self.reloadItem?(indexPaths)
        }
    }
}
