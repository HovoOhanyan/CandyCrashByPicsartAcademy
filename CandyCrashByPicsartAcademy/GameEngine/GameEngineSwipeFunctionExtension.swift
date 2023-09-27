//
//  GameEngineSwipeFunctionExtension.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 26.09.23.
//

import Foundation

extension GameEngine {
    func swipeUpGesture(indexPaths: [IndexPath]) {
        if indexPaths[0].row - self.numberOfItemsInRow >= 0 {
            self.gameBoard.swapAt(indexPaths[0].row, indexPaths[1].row)
            
            let tempIndexPath = gameBoard[indexPaths[1].row].indexPath
            gameBoard[indexPaths[1].row].indexPath = gameBoard[indexPaths[0].row].indexPath
            gameBoard[indexPaths[0].row].indexPath = tempIndexPath

            isMatch = true
            print(combo)
            combo = 0

            checkMatch()
        }
    }
    
    func swipeDownGesture(indexPaths: [IndexPath]) {
        if indexPaths[0].row + self.numberOfItemsInRow <= self.gameBoard.count {
            self.gameBoard.swapAt(indexPaths[0].row, indexPaths[1].row)
            
            let tempIndexPath = gameBoard[indexPaths[1].row].indexPath
            gameBoard[indexPaths[1].row].indexPath = gameBoard[indexPaths[0].row].indexPath
            gameBoard[indexPaths[0].row].indexPath = tempIndexPath
            
            isMatch = true
            print(combo)
            combo = 0

            checkMatch()
        }
    }
    
    func swipeLeftGesture(indexPaths: [IndexPath]) {
        self.gameBoard.swapAt(indexPaths[0].row, indexPaths[1].row)
        
        let tempIndexPath = gameBoard[indexPaths[1].row].indexPath
        gameBoard[indexPaths[1].row].indexPath = gameBoard[indexPaths[0].row].indexPath
        gameBoard[indexPaths[0].row].indexPath = tempIndexPath
        
        isMatch = true
        print(combo)
        combo = 0

        checkMatch()
    }
    
    func swipeRightGesture(indexPaths: [IndexPath]) {
        self.gameBoard.swapAt(indexPaths[0].row, indexPaths[1].row)
        
        
        let tempIndexPath = gameBoard[indexPaths[1].row].indexPath
        gameBoard[indexPaths[1].row].indexPath = gameBoard[indexPaths[0].row].indexPath
        gameBoard[indexPaths[0].row].indexPath = tempIndexPath
        
        isMatch = true
        print(combo)
        combo = 0
        checkMatch()
    }
}
