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
    
    private var boardCount = 0 // Counter to keep track of board creation progress.
    
    init(numberOfItemsInRow: Int, boardSize: Int) {
        self.numberOfItemsInRow = numberOfItemsInRow
        gameBoard = (1...boardSize).map({_ in EmptyInstance()})
    }
    
//MARK: - Method to create the game board by populating it with game instances.

    func createBoard() {
        while boardCount != gameBoard.count {
            var newInstace = GameInstanceView.random()
            
            switch boardCount {
            case 0:
                newInstace = GameInstanceView.random()
            case 1...numberOfItemsInRow:
                
                while gameBoard[boardCount - 1].id == newInstace.id {
                    newInstace = GameInstanceView.random()
                }
                
            case numberOfItemsInRow...gameBoard.count - numberOfItemsInRow - 1:
                
                while gameBoard[boardCount - 1].id == newInstace.id || gameBoard[self.boardCount - numberOfItemsInRow].id == newInstace.id || gameBoard[self.boardCount + numberOfItemsInRow].id == newInstace.id {
                    newInstace = GameInstanceView.random()
                }
                
            case gameBoard.count - numberOfItemsInRow...boardCount:
                
                while gameBoard[boardCount - 1].id == newInstace.id || gameBoard[self.boardCount - numberOfItemsInRow].id == newInstace.id {
                    newInstace = GameInstanceView.random()
                }
                
            default:
                break
            }
            
            gameBoard[boardCount] = newInstace
            boardCount += 1
        }
    }
}
