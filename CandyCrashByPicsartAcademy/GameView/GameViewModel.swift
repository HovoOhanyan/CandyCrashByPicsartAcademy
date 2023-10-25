//
//  GameViewModal.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 26.09.23.
//

import Foundation

final class GameViewModel {
    private(set) var gameEngine: GameEngine
    
    private let gameEngineBoardManager: GameEngineBoard
    var gameEnginePlayInfoManager: GameEnginePlayInformation
    
    // Initialize the view model with default parameters.
    init() {
        gameEngineBoardManager = GameEngineBoardManager(numberOfItemsInRow: 5, boardSize: 45)
        gameEnginePlayInfoManager = GameEnginePlayInformationManager(score: 20, countOfSteps: 10, updatedStarEstimation: 85)
        
        gameEngine = GameEngine(gameBoardManager: gameEngineBoardManager, gamePlayManager: gameEnginePlayInfoManager)
        gameEngine.gameBoardManager.createBoard()
    }
    
    // Initialize the view model with custom game board and play information managers.
    init(gameEngineBoardManager: GameEngineBoard, gameEnginePlayInfoManager: GameEnginePlayInformation) {
        self.gameEngineBoardManager = gameEngineBoardManager
        self.gameEnginePlayInfoManager = gameEnginePlayInfoManager
        
        gameEngine = GameEngine(gameBoardManager: self.gameEngineBoardManager, gamePlayManager: self.gameEnginePlayInfoManager)
        gameEngine.gameBoardManager.createBoard()
    }
    
    func changeGamePlayManager(gamePlayManager: GameEnginePlayInformationManager) {
        self.gameEnginePlayInfoManager = gamePlayManager
        self.gameEngine.changeGamePlayManager(gamePlayManager: gamePlayManager)
    }
 }
