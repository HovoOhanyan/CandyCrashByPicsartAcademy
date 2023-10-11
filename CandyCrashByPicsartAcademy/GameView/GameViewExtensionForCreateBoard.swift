//
//  GameViewExtensionForCreateBoard.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 10.10.23.
//

import UIKit

extension GameView {
    func createGameBoard(gameBoard: GameEngineBoard) {
        let columnSpacing = CGFloat(2 * (gameBoard.numberOfItemsInRow - 1))
        let rowSpacing = CGFloat(2 * ((gameBoard.gameBoard.count / gameBoard.numberOfItemsInRow) - 1))
        
        let instanceWidth = (gameAreaView.frame.width - columnSpacing) / CGFloat(gameBoard.numberOfItemsInRow)
        let instanceHeight = (gameAreaView.frame.height - rowSpacing) / CGFloat(gameBoard.gameBoard.count / gameBoard.numberOfItemsInRow)
        
        let boardRows = gameBoard.gameBoard.count / gameBoard.numberOfItemsInRow
        let boardColumn = gameBoard.numberOfItemsInRow
        
        let minX = gameAreaView.frame.minX
        let minY = gameAreaView.frame.minY
        
        gameInstanceArray = (1...gameBoard.gameBoard.count).map { _ in
            let view = GameInstanceView()
            view.isUserInteractionEnabled = false
            return view
        }
        
        for row in 0..<boardRows {
            for column in 0..<boardColumn {
                let index = column + (row * gameBoard.numberOfItemsInRow)
                gameInstanceArray[index].configuration(gameInstance: gameBoard.gameBoard[index], index: index)
                
                let instanceX = minX + CGFloat(column) * (instanceWidth + 2)
                let instanceY = minY + CGFloat(row) * (instanceHeight + 2)
                gameInstanceArray[index].frame = CGRect(x: instanceX, y: instanceY, width: instanceWidth, height: instanceHeight)
                
                // Add the subview to gameAreaView
                self.addSubview(gameInstanceArray[index])
            }
        }
    }
}
