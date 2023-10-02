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
                                                                boardSize: 40)
    
    private let gameEnginePlayInfoManager = GameEnginePlayInformationManager(score: 20, countOfSteps: 15)
    var reloadItem: (([IndexPath]) -> Void)?
    var updateScoreLabel: ((Int) -> Void)?
    var updateCountOfStepsLabel: ((Int) -> Void)?
    
    init() {
        gameEngine = GameEngine(gameBoardManager: gameEngineBoardManager, gamePlayManager: gameEnginePlayInfoManager)
        gameEngine.gameBoardManager.createBoard()
        hendlerDefinitons()
    }
    
    private func hendlerDefinitons() {
        gameEngine.gameEngineBoardHandler.fallDownHandler = { indexPaths in
            self.reloadItem?(indexPaths)
        }
        
        gameEngine.gameEngineBoardHandler.updateScoreLabelHandler = { score in
            self.updateScoreLabel?(score)
        }
        
        gameEngine.gameEngineBoardHandler.updateCountOfStepsLabelHandler = { countOfSteps in
            self.updateCountOfStepsLabel?(countOfSteps)
        }
    }
}
