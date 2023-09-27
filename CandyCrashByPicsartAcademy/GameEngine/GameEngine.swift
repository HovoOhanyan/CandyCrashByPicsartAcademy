//
//  GameEngine.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 25.09.23.
//

import Foundation

final class GameEngine {
//MARK: - GameEngine property definitions

    var gameBoard: [GameInstance]
    private(set) var numberOfItemsInRow: Int
    
    public var boardCount = 0
    private var currentInstance: GameInstance?
    
    var fallDown: (([IndexPath]) -> Void)?
    
    public var isMatch = true
    public var combo = 0 
    
//MARK: -
    
    init(numberOfItemsInRow: Int, boardSize: Int) {
        self.numberOfItemsInRow = numberOfItemsInRow
        gameBoard = (1...boardSize).map({_ in EmptyInstance()})
        gameBoard.reserveCapacity(boardSize)
    }
    
    func createGameBoard() {
        while boardCount != gameBoard.count {
            var newInstace = GameInstanceCell.random()
            
            switch boardCount {
            case 0...numberOfItemsInRow:
                
                while currentInstance?.id == newInstace.id {
                    newInstace = GameInstanceCell.random()
                }
                
            case numberOfItemsInRow...gameBoard.count - numberOfItemsInRow - 1:
                
                while currentInstance?.id == newInstace.id || gameBoard[self.boardCount - numberOfItemsInRow].id == newInstace.id || gameBoard[self.boardCount + numberOfItemsInRow].id == newInstace.id {
                    newInstace = GameInstanceCell.random()
                }
                
            case gameBoard.count - numberOfItemsInRow...boardCount:
                
                while currentInstance?.id == newInstace.id || gameBoard[self.boardCount - numberOfItemsInRow].id == newInstace.id {
                    newInstace = GameInstanceCell.random()
                }
                
            default:
                break
            }
            
            newInstace.indexPath = gameBoard[self.boardCount].indexPath
            currentInstance = newInstace
            gameBoard[boardCount] = newInstace
            boardCount += 1
        }
    }
}
