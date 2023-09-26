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
    
    private var boardCount = 0
    private var currentInstance: GameInstance?
    
//MARK: -
    
    init(numberOfItemsInRow: Int, boardSize: Int) {
        self.numberOfItemsInRow = numberOfItemsInRow
        gameBoard = (1...boardSize).map({_ in EmptyInstance()})
    }
    
    func createGameBoard() {
        while boardCount != gameBoard.count {
            var newInstace = GameInstanceCell.random()
            
            switch boardCount {
            case 0...numberOfItemsInRow:
                
                while currentInstance?.index == newInstace.index {
                    newInstace = GameInstanceCell.random()
                }
                
            case numberOfItemsInRow...gameBoard.count - numberOfItemsInRow - 1:
                
                while currentInstance?.index == newInstace.index || gameBoard[self.boardCount - numberOfItemsInRow].index == newInstace.index || gameBoard[self.boardCount + numberOfItemsInRow].index == newInstace.index {
                    newInstace = GameInstanceCell.random()
                }
                
            case gameBoard.count - numberOfItemsInRow...boardCount:
                
                while currentInstance?.index == newInstace.index || gameBoard[self.boardCount - numberOfItemsInRow].index == newInstace.index {
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
