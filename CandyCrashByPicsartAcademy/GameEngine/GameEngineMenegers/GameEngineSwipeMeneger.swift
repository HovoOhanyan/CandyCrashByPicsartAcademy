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
    
    func swipeUpGesture(index: Int) -> Bool {
        if index - self.gameBoardManager.numberOfItemsInRow >= 0 {
            let secondIndex = index - gameBoardManager.numberOfItemsInRow
            gameBoardManager.gameBoard.swapAt(index, secondIndex)
            
            if self.gameCheckManager.checkMatchForSwipeGesture() {
                gamePlayInfo.countOfSteps -= 1
                return true
            } else {
                gameBoardManager.gameBoard.swapAt(secondIndex, index)
                return false
            }
        } else {
            return false
        }
    }
    
    func swipeDownGesture(index: Int)  -> Bool {
        if index + self.gameBoardManager.numberOfItemsInRow <= self.gameBoardManager.gameBoard.count {
            let secondIndex = index + gameBoardManager.numberOfItemsInRow
            self.gameBoardManager.gameBoard.swapAt(index, secondIndex)
        
            if self.gameCheckManager.checkMatchForSwipeGesture() {
                gamePlayInfo.countOfSteps -= 1
                return true
            } else {
                gameBoardManager.gameBoard.swapAt(secondIndex, index)
                return false
            }
        } else {
            return false
        }
    }
    
    func swipeLeftGesture(index: Int)  -> Bool {
        let secondIndex = index - 1
        
        self.gameBoardManager.gameBoard.swapAt(index, secondIndex)
        if self.gameCheckManager.checkMatchForSwipeGesture() {
            gamePlayInfo.countOfSteps -= 1
            return true
        } else {
            gameBoardManager.gameBoard.swapAt(secondIndex, index)
            return false
        }
    }
    
    func swipeRightGesture(index: Int)  -> Bool {
        let secondIndex = index + 1

        self.gameBoardManager.gameBoard.swapAt(index, secondIndex)
        if self.gameCheckManager.checkMatchForSwipeGesture() {
            gamePlayInfo.countOfSteps -= 1
            return true
        } else {
            gameBoardManager.gameBoard.swapAt(secondIndex, index)
            return false
        }
    }
}
