//
//  GameEnginePlayInformationManager.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Er Baghdasaryan on 02.10.23.
//

import Foundation

final class GameEnginePlayInformationManager: GameEnginePlayInformation {
    
    var score: Int
    
    var countOfSteps: Int {
        didSet {
            gameEngineChangeHandler.updateLabelHandler?(score, countOfSteps)
        }
    }
    
    var updatedStarEstimation: Int {
        didSet {
            gameEngineChangeHandler.updateStarChangesHandler?(updatedStarEstimation)
        }
    }
    
    
    var gameInstance: GameInstance
    
    private var gameEngineChangeHandler: GameEngineBoardChangeHandler!
    
    init(score: Int, countOfSteps: Int, updatedStarEstimation: Int) {
        self.score = score
        self.countOfSteps = countOfSteps
        self.updatedStarEstimation = updatedStarEstimation
        self.gameInstance = GameInstanceView.random()
    }
    
    func addGameEnigneChangeHandler(gameEngineChangeHandler: GameEngineBoardChangeHandler) {
        self.gameEngineChangeHandler = gameEngineChangeHandler
    }
}
