//
//  GameEngineSwipeMeneger.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 30.09.23.
//

import Foundation

final class GameEngineSwipeManager: GameEngineSwipeGestureHandler {
    private var gameBoardMeneger: GameEngineBoard!
    
    init(gameBoardMeneger: GameEngineBoard) {
        self.gameBoardMeneger = gameBoardMeneger
    }
    
    func swipeUpGesture(indexPaths: [IndexPath]) {
        if indexPaths[0].row - self.gameBoardMeneger.numberOfItemsInRow >= 0 {
            gameBoardMeneger.gameBoard.swapAt(indexPaths[0].row, indexPaths[1].row)
            
            let tempIndexPath = gameBoardMeneger.gameBoard[indexPaths[1].row].indexPath
            gameBoardMeneger.gameBoard[indexPaths[1].row].indexPath = gameBoardMeneger.gameBoard[indexPaths[0].row].indexPath
            gameBoardMeneger.gameBoard[indexPaths[0].row].indexPath = tempIndexPath
        }
    }
    
    func swipeDownGesture(indexPaths: [IndexPath]) {
        if indexPaths[0].row + self.gameBoardMeneger.numberOfItemsInRow <= self.gameBoardMeneger.gameBoard.count {
            self.gameBoardMeneger.gameBoard.swapAt(indexPaths[0].row, indexPaths[1].row)
            
            let tempIndexPath = gameBoardMeneger.gameBoard[indexPaths[1].row].indexPath
            gameBoardMeneger.gameBoard[indexPaths[1].row].indexPath = gameBoardMeneger.gameBoard[indexPaths[0].row].indexPath
            gameBoardMeneger.gameBoard[indexPaths[0].row].indexPath = tempIndexPath
        }
    }
    
    func swipeLeftGesture(indexPaths: [IndexPath]) {
        self.gameBoardMeneger.gameBoard.swapAt(indexPaths[0].row, indexPaths[1].row)
        
        let tempIndexPath = gameBoardMeneger.gameBoard[indexPaths[1].row].indexPath
        gameBoardMeneger.gameBoard[indexPaths[1].row].indexPath = gameBoardMeneger.gameBoard[indexPaths[0].row].indexPath
        gameBoardMeneger.gameBoard[indexPaths[0].row].indexPath = tempIndexPath
    }
    
    func swipeRightGesture(indexPaths: [IndexPath]) {
        self.gameBoardMeneger.gameBoard.swapAt(indexPaths[0].row, indexPaths[1].row)
        
        let tempIndexPath = gameBoardMeneger.gameBoard[indexPaths[1].row].indexPath
        gameBoardMeneger.gameBoard[indexPaths[1].row].indexPath = gameBoardMeneger.gameBoard[indexPaths[0].row].indexPath
        gameBoardMeneger.gameBoard[indexPaths[0].row].indexPath = tempIndexPath
    }
    
    
}
