//
//  GameEngine.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 25.09.23.
//

import Foundation

final class GameEngine {
//MARK: - GameEngine property definitions
    private(set) var gameBoardManager: GameEngineBoard
    private(set) var gameSwipeManager: GameEngineSwipeGestureHandler
    private(set) var gameCheckMatchsManager: GameEngineCheckMatches
    private(set) var gameEngineBoardHandler: GameEngineBoardChangeHandler
    var gamePlayManager: GameEnginePlayInformation
    
    //MARK: -
    
    init(gameBoardManager: GameEngineBoard, gamePlayManager: GameEnginePlayInformation) {
        self.gameBoardManager = gameBoardManager
        self.gamePlayManager = gamePlayManager
        self.gameEngineBoardHandler = GameEngineBoardHandler()
        
        self.gameCheckMatchsManager = GameEngineCheckManager(gameEngineBoardManager: self.gameBoardManager,
                                                             gameEngineBoardHandler: gameEngineBoardHandler, gamePlayInfo: self.gamePlayManager)
        
        self.gameSwipeManager = GameEngineSwipeManager(gameBoardManager: self.gameBoardManager,
                                                       gamePlayInfo: gamePlayManager, gameCheckManager: gameCheckMatchsManager)
        
        gamePlayManager.addGameEnigneChangeHandler(gameEngineChangeHandler: self.gameEngineBoardHandler)
    }
    
    init(gameBoardManager: GameEngineBoard, gameSwipeManager: GameEngineSwipeManager,
         gameCheckMatchsManager: GameEngineCheckMatches, gameEngineBoardHandler: GameEngineBoardChangeHandler, 
         gamePlayManager: GameEnginePlayInformation) {
        self.gameBoardManager = gameBoardManager
        self.gameSwipeManager = gameSwipeManager
        self.gameCheckMatchsManager = gameCheckMatchsManager
        self.gameEngineBoardHandler = gameEngineBoardHandler
        self.gamePlayManager = gamePlayManager
    }
}
