//
//  GameViewModal.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 26.09.23.
//

import Foundation

final class GameViewModel {
    private(set) var gameEngine: GameEngine
    private let gameEngineBoardManager = GameEngineBoardManager(numberOfItemsInRow: 5,
                                                                boardSize: 45)
    
    private let gameEnginePlayInfoManager = GameEnginePlayInformationManager(score: 20, countOfSteps: 10, updatedStarEstimation: 85)
    
    init() {
        gameEngine = GameEngine(gameBoardManager: gameEngineBoardManager, gamePlayManager: gameEnginePlayInfoManager)
        gameEngine.gameBoardManager.createBoard()
    }
}
