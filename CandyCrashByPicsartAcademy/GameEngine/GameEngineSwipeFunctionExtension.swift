//
//  GameEngineSwipeFunctionExtension.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 26.09.23.
//

import Foundation

extension GameEngine {
    func swipeUpGesture(index: Int) {
        if index - self.numberOfItemsInRow >= 0 {
            self.gameBoard.swapAt(index, index - self.numberOfItemsInRow)
        }
    }
    
    func swipeDownGesture(index: Int) {
        if index + self.numberOfItemsInRow <= self.gameBoard.count {
            self.gameBoard.swapAt(index, index + self.numberOfItemsInRow)
        }
    }
    
    func swipeLeftGesture(index: Int) {
        gameBoard.swapAt(index, index - 1)
    }
    
    func swipeRightGesture(index: Int) {
        gameBoard.swapAt(index, index + 1)
    }
    
    func fallDownAnimation(indexPath: IndexPath) {
        let index = indexPath.row
        
        gameBoard.swapAt(index, index + numberOfItemsInRow)
    }
}
