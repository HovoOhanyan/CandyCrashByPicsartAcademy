//
//  GameEngineCheckMatchExtension.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 27.09.23.
//

import Foundation

extension GameEngine {
    public func checkThreeMatchAtRow() -> Bool {
        for row in 0...gameBoard.count / numberOfItemsInRow - 1 {
            for column in 0...numberOfItemsInRow - 3 {
                
                let index = column + (row * numberOfItemsInRow)
                
                if gameBoard[index].id == gameBoard[index + 1].id &&
                    gameBoard[index].id == gameBoard[index + 2].id &&
                    gameBoard[index].id != 0 {
                                        
                    var currentIndex = index
                    
                    var firstInstance = GameInstanceCell.random()
                    firstInstance.indexPath = gameBoard[index].indexPath
                    
                    var secondInstance = GameInstanceCell.random()
                    secondInstance.indexPath = gameBoard[index + 1].indexPath
                    
                    var thiredInstance = GameInstanceCell.random()
                    thiredInstance.indexPath = gameBoard[index + 2].indexPath
                    
                    gameBoard[index] = firstInstance
                    gameBoard[index + 1] = secondInstance
                    gameBoard[index + 2] = thiredInstance
                    
                    
                    while currentIndex >= numberOfItemsInRow {
                        gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow)
                        gameBoard.swapAt(currentIndex + 1, (currentIndex + 1) - numberOfItemsInRow)
                        gameBoard.swapAt(currentIndex + 2, (currentIndex + 2) - numberOfItemsInRow)
                        
                        let firstTempIndexPath = gameBoard[currentIndex].indexPath
                        gameBoard[currentIndex].indexPath = gameBoard[currentIndex - numberOfItemsInRow].indexPath
                        gameBoard[currentIndex - numberOfItemsInRow].indexPath = firstTempIndexPath
                        
                        let secondTempIndexPath = gameBoard[currentIndex + 1].indexPath
                        gameBoard[currentIndex + 1].indexPath = gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath
                        gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath = secondTempIndexPath
                        
                        let thirdTempIndexPath = gameBoard[currentIndex + 2].indexPath
                        gameBoard[currentIndex + 2].indexPath = gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath
                        gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath = thirdTempIndexPath
                        
                        let indexPaths = [gameBoard[currentIndex].indexPath,
                                          gameBoard[currentIndex + 1].indexPath,
                                          gameBoard[currentIndex + 2].indexPath,
                                          gameBoard[currentIndex - numberOfItemsInRow].indexPath,
                                          gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath,
                                          gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath,
                        ]
                        
                        fallDown?(indexPaths)
                        currentIndex -= numberOfItemsInRow
                    }
                    
                    fallDown?([gameBoard[currentIndex].indexPath,
                               gameBoard[currentIndex + 1].indexPath,
                               gameBoard[currentIndex + 2].indexPath
                              ])
                    
                    return true
                }
            }
        }
        
        return false
    }
    
    public func checkThreeMatchAtColumn() -> Bool {
        for row in 0...gameBoard.count / numberOfItemsInRow - 3 {
            for column in 0...numberOfItemsInRow - 1 {
                
                let index = column + (row * numberOfItemsInRow)
                
                if gameBoard[index].id == gameBoard[index + numberOfItemsInRow].id &&
                    gameBoard[index].id == gameBoard[index + numberOfItemsInRow * 2].id
                {
                    
                    var currentIndex = index + numberOfItemsInRow * 2
                    
                    var firstInstance = GameInstanceCell.random()
                    firstInstance.indexPath = gameBoard[index].indexPath
                    
                    var secondInstance = GameInstanceCell.random()
                    secondInstance.indexPath = gameBoard[index + numberOfItemsInRow].indexPath
                    
                    var thiredInstance = GameInstanceCell.random()
                    thiredInstance.indexPath = gameBoard[index + numberOfItemsInRow * 2].indexPath
                    
                    gameBoard[index] = firstInstance
                    gameBoard[index + numberOfItemsInRow] = secondInstance
                    gameBoard[index + numberOfItemsInRow * 2] = thiredInstance
                    
                    
                    while currentIndex >= numberOfItemsInRow * 3 {
                        print(currentIndex)
                        gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow * 3)
                        
                        let firstTempIndexPath = gameBoard[currentIndex].indexPath
                        gameBoard[currentIndex].indexPath = gameBoard[currentIndex - numberOfItemsInRow * 3].indexPath
                        gameBoard[currentIndex - numberOfItemsInRow * 3].indexPath = firstTempIndexPath
                        
                        fallDown?([gameBoard[currentIndex].indexPath, gameBoard[currentIndex - numberOfItemsInRow * 3].indexPath])
                        currentIndex -= numberOfItemsInRow
                    }
                    
                    fallDown?([gameBoard[index].indexPath,
                               gameBoard[index + numberOfItemsInRow].indexPath,
                               gameBoard[index + numberOfItemsInRow * 2].indexPath
                              ])
                    return true
                }
            }
        }
        
        return false
    }

    func checkMatch() {
        while isMatch {
            isMatch = false
            
            if checkThreeMatchAtRow() {
                isMatch = true
            } else if checkThreeMatchAtColumn() {
                isMatch = true
            }
           
        }
    }
}

