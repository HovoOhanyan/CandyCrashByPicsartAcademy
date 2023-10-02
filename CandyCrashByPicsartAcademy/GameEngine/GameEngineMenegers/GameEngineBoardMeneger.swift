//
//  GameEngineBoardMeneger.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 30.09.23.
//

import Foundation

final class GameEngineBoardManager: GameEngineBoard {
    var gameBoard: [GameInstance]
    
    var numberOfItemsInRow: Int
    
    private var boardCount = 0
    
    init(numberOfItemsInRow: Int, boardSize: Int) {
        self.numberOfItemsInRow = numberOfItemsInRow

        gameBoard = (1...boardSize).map({_ in EmptyInstance()})
    }
    
    func createBoard() {
        while boardCount != gameBoard.count {
            var newInstace = GameInstanceCell.random()
            
            switch boardCount {
            case 0:
                newInstace = GameInstanceCell.random()
            case 1...numberOfItemsInRow:
                
                while gameBoard[boardCount - 1].id == newInstace.id {
                    newInstace = GameInstanceCell.random()
                }
                
            case numberOfItemsInRow...gameBoard.count - numberOfItemsInRow - 1:
                
                while gameBoard[boardCount - 1].id == newInstace.id || gameBoard[self.boardCount - numberOfItemsInRow].id == newInstace.id || gameBoard[self.boardCount + numberOfItemsInRow].id == newInstace.id {
                    newInstace = GameInstanceCell.random()
                }
                
            case gameBoard.count - numberOfItemsInRow...boardCount:
                
                while gameBoard[boardCount - 1].id == newInstace.id || gameBoard[self.boardCount - numberOfItemsInRow].id == newInstace.id {
                    newInstace = GameInstanceCell.random()
                }
                
            default:
                break
            }
            
            newInstace.indexPath = gameBoard[self.boardCount].indexPath
            gameBoard[boardCount] = newInstace
            boardCount += 1
        }
    }
    
    
}
