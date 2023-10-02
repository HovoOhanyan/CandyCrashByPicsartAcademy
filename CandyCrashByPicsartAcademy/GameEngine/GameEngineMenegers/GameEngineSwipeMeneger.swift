//
//  GameEngineSwipeMeneger.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 30.09.23.
//

import Foundation

final class GameEngineSwipeManager: GameEngineSwipeGestureHandler {
    private var gameBoardManager: GameEngineBoard!
    
    init(gameBoardManager: GameEngineBoard) {
        self.gameBoardManager = gameBoardManager
    }
    
    func swipeUpGesture(indexPaths: [IndexPath]) {
        if indexPaths[0].row - self.gameBoardManager.numberOfItemsInRow >= 0 {
            gameBoardManager.gameBoard.swapAt(indexPaths[0].row, indexPaths[1].row)
            
            let tempIndexPath = gameBoardManager.gameBoard[indexPaths[1].row].indexPath
            gameBoardManager.gameBoard[indexPaths[1].row].indexPath = gameBoardManager.gameBoard[indexPaths[0].row].indexPath
            gameBoardManager.gameBoard[indexPaths[0].row].indexPath = tempIndexPath
        }
    }
    
    func swipeDownGesture(indexPaths: [IndexPath]) {
        if indexPaths[0].row + self.gameBoardManager.numberOfItemsInRow <= self.gameBoardManager.gameBoard.count {
            self.gameBoardManager.gameBoard.swapAt(indexPaths[0].row, indexPaths[1].row)
            
            let tempIndexPath = gameBoardManager.gameBoard[indexPaths[1].row].indexPath
            gameBoardManager.gameBoard[indexPaths[1].row].indexPath = gameBoardManager.gameBoard[indexPaths[0].row].indexPath
            gameBoardManager.gameBoard[indexPaths[0].row].indexPath = tempIndexPath
        }
    }
    
    func swipeLeftGesture(indexPaths: [IndexPath]) {
        self.gameBoardManager.gameBoard.swapAt(indexPaths[0].row, indexPaths[1].row)
        
        let tempIndexPath = gameBoardManager.gameBoard[indexPaths[1].row].indexPath
        gameBoardManager.gameBoard[indexPaths[1].row].indexPath = gameBoardManager.gameBoard[indexPaths[0].row].indexPath
        gameBoardManager.gameBoard[indexPaths[0].row].indexPath = tempIndexPath
    }
    
    func swipeRightGesture(indexPaths: [IndexPath]) {
        self.gameBoardManager.gameBoard.swapAt(indexPaths[0].row, indexPaths[1].row)
        
        let tempIndexPath = gameBoardManager.gameBoard[indexPaths[1].row].indexPath
        gameBoardManager.gameBoard[indexPaths[1].row].indexPath = gameBoardManager.gameBoard[indexPaths[0].row].indexPath
        gameBoardManager.gameBoard[indexPaths[0].row].indexPath = tempIndexPath
    }
    
    
}
