//
//  GameEngine.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 25.09.23.
//

import Foundation

final class GameEngine {
//MARK: - GameEngine property definitions
    private(set) var gameBoardManager: GameEngineBoard!
    private(set) var gameSwipeManager: GameEngineSwipeGestureHandler!
    private(set) var gameCheckMatchsManager: GameEngineCheckMatches!
    private(set) var gameEngineBoardHandler: GameEngineBoardChangeHandler!
    
    //MARK: -
    
    init(gameBoardManager: GameEngineBoard) {
        self.gameBoardManager = gameBoardManager
        self.gameSwipeManager = GameEngineSwipeManager(gameBoardMeneger: self.gameBoardManager)
        self.gameEngineBoardHandler = GameEngineBoardHandler()
        self.gameCheckMatchsManager = GameEngineCheckManager(gameEngineBoardMeneger: self.gameBoardManager,
                                                             gameEngineBoardHendler: gameEngineBoardHandler)
    }
    
    init(gameBoardManager: GameEngineBoard, gameSwipeManager: GameEngineSwipeManager,
         gameCheckMatchsManager: GameEngineCheckMatches, gameEngineBoardHandler: GameEngineBoardChangeHandler) {
        self.gameBoardManager = gameBoardManager
        self.gameSwipeManager = gameSwipeManager
        self.gameCheckMatchsManager = gameCheckMatchsManager
        self.gameEngineBoardHandler = gameEngineBoardHandler
    }
}
