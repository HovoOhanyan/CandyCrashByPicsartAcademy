//
//  GameEnginePlayInformation.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Er Baghdasaryan on 02.10.23.
//

import Foundation

protocol GameEnginePlayInformation {
    var score: Int { get set }
    var countOfSteps: Int { get set }
    var updatedStarEstimation: Int { get set }
    var gameInstance: GameInstance { get set }
    var combo: Int { get set }
    func addGameEnigneChangeHandler(gameEngineChangeHandler: GameEngineBoardChangeHandler)
}
