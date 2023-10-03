//
//  GameEngineSwipeMeneger.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 30.09.23.
//

import Foundation

final class GameEngineSwipeManager: GameEngineSwipeGestureHandler {
    private var gameBoardManager: GameEngineBoard
    private var gamePlayInfo: GameEnginePlayInformation
    private var gameCheckManager: GameEngineCheckMatches
    
    init(gameBoardManager: GameEngineBoard, gamePlayInfo: GameEnginePlayInformation, gameCheckManager: GameEngineCheckMatches) {
        self.gameBoardManager = gameBoardManager
        self.gamePlayInfo = gamePlayInfo
        self.gameCheckManager = gameCheckManager
    }
    
    func swipeUpGesture(indexPaths: [IndexPath]) {
        if indexPaths[0].row - self.gameBoardManager.numberOfItemsInRow >= 0 {
            gameBoardManager.gameBoard.swapAt(indexPaths[0].row, indexPaths[1].row)
            
            if self.gameCheckManager.checkMatchForSwipeGesture() {
                
                let tempIndexPath = gameBoardManager.gameBoard[indexPaths[1].row].indexPath
                gameBoardManager.gameBoard[indexPaths[1].row].indexPath =
                gameBoardManager.gameBoard[indexPaths[0].row].indexPath
                gameBoardManager.gameBoard[indexPaths[0].row].indexPath = tempIndexPath
                
                gamePlayInfo.countOfSteps -= 1
            } else {
                gameBoardManager.gameBoard.swapAt(indexPaths[1].row, indexPaths[0].row)
            }
        }
    }
    
    func swipeDownGesture(indexPaths: [IndexPath]) {
        if indexPaths[0].row + self.gameBoardManager.numberOfItemsInRow <= self.gameBoardManager.gameBoard.count {
            self.gameBoardManager.gameBoard.swapAt(indexPaths[0].row, indexPaths[1].row)
            
            if self.gameCheckManager.checkMatchForSwipeGesture() {
                
                let tempIndexPath = gameBoardManager.gameBoard[indexPaths[1].row].indexPath
                gameBoardManager.gameBoard[indexPaths[1].row].indexPath =
                gameBoardManager.gameBoard[indexPaths[0].row].indexPath
                gameBoardManager.gameBoard[indexPaths[0].row].indexPath = tempIndexPath
                
                gamePlayInfo.countOfSteps -= 1
            } else {
                gameBoardManager.gameBoard.swapAt(indexPaths[1].row, indexPaths[0].row)
            }
        }
    }
    
    func swipeLeftGesture(indexPaths: [IndexPath]) {
        self.gameBoardManager.gameBoard.swapAt(indexPaths[0].row, indexPaths[1].row)
        if self.gameCheckManager.checkMatchForSwipeGesture() {
            
            let tempIndexPath = gameBoardManager.gameBoard[indexPaths[1].row].indexPath
            gameBoardManager.gameBoard[indexPaths[1].row].indexPath =
            gameBoardManager.gameBoard[indexPaths[0].row].indexPath
            gameBoardManager.gameBoard[indexPaths[0].row].indexPath = tempIndexPath
            
            gamePlayInfo.countOfSteps -= 1
        } else {
            gameBoardManager.gameBoard.swapAt(indexPaths[1].row, indexPaths[0].row)
        }
    }
    
    func swipeRightGesture(indexPaths: [IndexPath]) {
        self.gameBoardManager.gameBoard.swapAt(indexPaths[0].row, indexPaths[1].row)
        if self.gameCheckManager.checkMatchForSwipeGesture() {
            
            let tempIndexPath = gameBoardManager.gameBoard[indexPaths[1].row].indexPath
            gameBoardManager.gameBoard[indexPaths[1].row].indexPath =
            gameBoardManager.gameBoard[indexPaths[0].row].indexPath
            gameBoardManager.gameBoard[indexPaths[0].row].indexPath = tempIndexPath
            
            gamePlayInfo.countOfSteps -= 1
        } else {
            gameBoardManager.gameBoard.swapAt(indexPaths[1].row, indexPaths[0].row)
        }
    }
    
    
}
