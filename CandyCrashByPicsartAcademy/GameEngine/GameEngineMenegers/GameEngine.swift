//
//  GameEngine.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 25.09.23.
//

import Foundation

final class GameEngine {
//MARK: - GameEngine property definitions
    private(set) var gameBoardMeneger: GameEngineBoard!
    private(set) var gameSwipeMeneger: GameEngineSwipeGestureHendler!
    private(set) var gameCheckMatchsMeneger: GameEngineCheckMatches!
    var gameEngineBoardHendler: GameEngineBoardChangeHendler!
    public var isMatch = true
    public var combo = 0 
    
    var fallDownHendler: (([IndexPath]) -> Void)?
//MARK: -
    
    init(gameBoardMeneger: GameEngineBoard) {
        self.gameBoardMeneger = gameBoardMeneger
        self.gameSwipeMeneger = GameEngineSwipeMeneger(gameBoardMeneger: self.gameBoardMeneger)
        self.gameEngineBoardHendler = GameEngineBoardHendler()
        self.gameCheckMatchsMeneger = GameEngineCheckMeneger(gameEngineBoardMeneger: self.gameBoardMeneger,
                                                             gameEngineBoardHendler: gameEngineBoardHendler)
    }
}
