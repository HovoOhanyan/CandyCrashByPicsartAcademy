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
    
    private let gameEnginePlayInfoManager = GameEnginePlayInformationManager(score: 20, countOfSteps: 10, updatedStarEstimation: 85)
   
    var reloadItem: (([Int]) -> Void)?
    var fallDownAtRow: (([Int]) -> Void)?
    var fallDownAtColumn: ((Int, Int) -> Void)?
    var updateLabel: ((Int, Int) -> Void)?
    var updateCountOfStepsLabel: ((Int) -> Void)?
    var updateStarLayer: ((Int) -> Void)?
    
    init() {
        gameEngine = GameEngine(gameBoardManager: gameEngineBoardManager, gamePlayManager: gameEnginePlayInfoManager)
        gameEngine.gameBoardManager.createBoard()
        hendlerDefinitons()
    }
    
    private func hendlerDefinitons() {
        gameEngine.gameEngineBoardHandler.reloadItems = { indexes in
            self.reloadItem?(indexes)
        }
        
        gameEngine.gameEngineBoardHandler.fallDownAtRow = { indexes in
            self.fallDownAtRow?(indexes)
        }
        
        gameEngine.gameEngineBoardHandler.fallDownAtColumn = { index, check in
            self.fallDownAtColumn?(index, check)
        }
        gameEngine.gameEngineBoardHandler.updateLabelHandler = { score, countOfSteps in
            self.updateLabel?(score, countOfSteps)
        }
        
        gameEngine.gameEngineBoardHandler.updateCountOfStepsLabelHandler = { countOfSteps in
            self.updateCountOfStepsLabel?(countOfSteps)
        }
        
        gameEngine.gameEngineBoardHandler.updateStarChangesHandler = { starChanges in
            self.updateStarLayer?(starChanges)
        }
    }
}
