//
//  GameEnginePlayInformationManager.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Er Baghdasaryan on 02.10.23.
//

import Foundation

final class GameEnginePlayInformationManager: GameEnginePlayInformation {
    
    private var defaults = UserDefaults.standard
    private let identifier = "gameEnginePlayInformationManager"
    
    var score: Int {
        didSet {
            gameEngineChangeHandler.updateLabelHandler?(score, countOfSteps)
        }
    }
    
    var countOfSteps: Int {
        didSet {
            gameEngineChangeHandler.updateLabelHandler?(score, countOfSteps)
        }
    }
    
    var combo: Int = 0 {
        didSet {
            gameEngineChangeHandler.comboHandler?(combo)
        }
    }
    
    var isUserInteractionEnabled: Bool = true {
        didSet {
            gameEngineChangeHandler.isUserInteractionEnabledHandler?(isUserInteractionEnabled)
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

//MARK: Save to UserDefaults
extension GameEnginePlayInformationManager {
    
    public func saveToUserDefaults(gameData: GameDataToSave) {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(gameData) {
            defaults.set(encodedData, forKey: self.identifier)
        }
    }

    public func loadFromUserDefaults() -> GameDataToSave? {
        if let savedData = defaults.data(forKey: self.identifier) {
            let decoder = JSONDecoder()
            if let loadedData = try? decoder.decode(GameDataToSave.self, from: savedData) {
                return loadedData
            }
        }
        return nil
    }
}
