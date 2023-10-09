//
//  GameEnginePlayInformationManager.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Er Baghdasaryan on 02.10.23.
//

import Foundation

final class GameEnginePlayInformationManager: GameEnginePlayInformation {
    
    var score: Int {
        didSet {
            gameEngineChangeHandler.updateScoreLabelHandler?(score)
        }
    }
    
    var countOfSteps: Int {
        didSet {
            gameEngineChangeHandler.updateCountOfStepsLabelHandler?(countOfSteps)
       
        }
    }
    
    var updatedStarEstimation: Int {
        didSet {
            gameEngineChangeHandler.updateStarChangesHandler?(updatedStarEstimation)
        }
    }
    
    var gameInstance: GameInstance
    
    private var gameEngineChangeHandler: GameEngineBoardChangeHandler
    
    init(score: Int, countOfSteps: Int, updatedStarEstimation: Int) {
        self.score = score
        self.countOfSteps = score
        self.updatedStarEstimation = updatedStarEstimation
        self.gameInstance = GameInstanceCell.random()
    }
    
    func addGameEnigneChangeHandler(gameEngineChangeHandler: GameEngineBoardChangeHandler) {
        self.gameEngineChangeHandler = gameEngineChangeHandler
    }
}
