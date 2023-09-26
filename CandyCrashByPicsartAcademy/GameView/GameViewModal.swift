//
//  GameViewModal.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 26.09.23.
//

import Foundation

final class GameViewModal {
    private(set) var gameEngine: GameEngine
    
    init(numberOfItemsInRow: Int, boardSize: Int) {
        gameEngine = GameEngine(numberOfItemsInRow: numberOfItemsInRow, boardSize: boardSize)
        gameEngine.createGameBoard()
    }
}
