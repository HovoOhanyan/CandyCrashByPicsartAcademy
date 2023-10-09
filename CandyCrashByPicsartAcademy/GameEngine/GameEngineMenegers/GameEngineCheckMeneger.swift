//
//  GameEngineCheckMeneger.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 30.09.23.
//

import Foundation

final class GameEngineCheckManager: GameEngineCheckMatches {    
    private let gameBoardManager: GameEngineBoard
    private let gameBoardHandler: GameEngineBoardChangeHandler
    private var gamePlayInfo: GameEnginePlayInformation
    
    private var isMatch = true
    
    init(gameEngineBoardManager: GameEngineBoard,
         gameEngineBoardHandler: GameEngineBoardChangeHandler,
         gamePlayInfo: GameEnginePlayInformation) {
        self.gameBoardManager = gameEngineBoardManager
        self.gameBoardHandler = gameEngineBoardHandler
        self.gamePlayInfo = gamePlayInfo
    }
    
    func checkFiveMatchAtRow() -> Bool {
        let numberOfItemsInRow = gameBoardManager.numberOfItemsInRow
        
        for row in 0...gameBoardManager.gameBoard.count / numberOfItemsInRow - 1 {
            for column in 0...gameBoardManager.numberOfItemsInRow - 5 {
                
                let index = column + (row * numberOfItemsInRow)
                
                if gameBoardManager.gameBoard[index].id == gameBoardManager.gameBoard[index + 1].id &&
                    gameBoardManager.gameBoard[index].id == gameBoardManager.gameBoard[index + 2].id &&
                    gameBoardManager.gameBoard[index].id == gameBoardManager.gameBoard[index + 3].id &&
                    gameBoardManager.gameBoard[index].id ==  gameBoardManager.gameBoard[index + 4].id
                {
                    
                    if gameBoardManager.gameBoard[index].id == gamePlayInfo.gameInstance.id {
                        gamePlayInfo.score -= 5
                        gamePlayInfo.updatedStarEstimation = 5 * (150 / gamePlayInfo.score)
                    }
                    
                    var currentIndex = index
                    
                    var firstInstance = EmptyInstance()
                    firstInstance.indexPath = gameBoardManager.gameBoard[index].indexPath
                    
                    var secondInstance = EmptyInstance()
                    secondInstance.indexPath = gameBoardManager.gameBoard[index + 1].indexPath
                    
                    var thiredInstance = EmptyInstance()
                    thiredInstance.indexPath = gameBoardManager.gameBoard[index + 2].indexPath
                    
                    var fourthInstance = EmptyInstance()
                    fourthInstance.indexPath = gameBoardManager.gameBoard[index + 3].indexPath
                    
                    var fifthIstance = EmptyInstance()
                    fifthIstance.indexPath = gameBoardManager.gameBoard[index + 4].indexPath
                    
                    gameBoardManager.gameBoard[index] = firstInstance
                    gameBoardManager.gameBoard[index + 1] = secondInstance
                    gameBoardManager.gameBoard[index + 2] = thiredInstance
                    gameBoardManager.gameBoard[index + 3] = fourthInstance
                    gameBoardManager.gameBoard[index + 4] = fifthIstance
                    
                    while currentIndex >= numberOfItemsInRow {
                        gameBoardManager.gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow)
                        gameBoardManager.gameBoard.swapAt(currentIndex + 1, (currentIndex + 1) - numberOfItemsInRow)
                        gameBoardManager.gameBoard.swapAt(currentIndex + 2, (currentIndex + 2) - numberOfItemsInRow)
                        gameBoardManager.gameBoard.swapAt(currentIndex + 3, (currentIndex + 3) - numberOfItemsInRow)
                        gameBoardManager.gameBoard.swapAt(currentIndex + 4, (currentIndex + 4) - numberOfItemsInRow)
                        
                        let firstTempIndexPath = gameBoardManager.gameBoard[currentIndex].indexPath
                        gameBoardManager.gameBoard[currentIndex].indexPath = gameBoardManager.gameBoard[currentIndex - numberOfItemsInRow].indexPath
                        gameBoardManager.gameBoard[currentIndex - numberOfItemsInRow].indexPath = firstTempIndexPath
                        
                        let secondTempIndexPath = gameBoardManager.gameBoard[currentIndex + 1].indexPath
                        gameBoardManager.gameBoard[currentIndex + 1].indexPath = gameBoardManager.gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath
                        gameBoardManager.gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath = secondTempIndexPath
                        
                        let thirdTempIndexPath = gameBoardManager.gameBoard[currentIndex + 2].indexPath
                        gameBoardManager.gameBoard[currentIndex + 2].indexPath = gameBoardManager.gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath
                        gameBoardManager.gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath = thirdTempIndexPath
                        
                        let fourthTempIndexPath = gameBoardManager.gameBoard[currentIndex + 3].indexPath
                        gameBoardManager.gameBoard[currentIndex + 3].indexPath = gameBoardManager.gameBoard[(currentIndex + 3) - numberOfItemsInRow].indexPath
                        gameBoardManager.gameBoard[(currentIndex + 3) - numberOfItemsInRow].indexPath = fourthTempIndexPath
                        
                        let fifthTempIndexPath = gameBoardManager.gameBoard[currentIndex + 4].indexPath
                        gameBoardManager.gameBoard[currentIndex + 4].indexPath = gameBoardManager.gameBoard[(currentIndex + 4) - numberOfItemsInRow].indexPath
                        gameBoardManager.gameBoard[(currentIndex + 4) - numberOfItemsInRow].indexPath = fifthTempIndexPath
                        
                        let indexPaths = [gameBoardManager.gameBoard[currentIndex].indexPath,
                                          gameBoardManager.gameBoard[currentIndex + 1].indexPath,
                                          gameBoardManager.gameBoard[currentIndex + 2].indexPath,
                                          gameBoardManager.gameBoard[currentIndex + 3].indexPath,
                                          gameBoardManager.gameBoard[currentIndex + 4].indexPath,
                                          gameBoardManager.gameBoard[currentIndex - numberOfItemsInRow].indexPath,
                                          gameBoardManager.gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath,
                                          gameBoardManager.gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath,
                                          gameBoardManager.gameBoard[(currentIndex + 3) - numberOfItemsInRow].indexPath,
                                          gameBoardManager.gameBoard[(currentIndex + 4) - numberOfItemsInRow].indexPath
                        ]
                        
                        gameBoardHandler.fallDownHandler?(indexPaths)
                        currentIndex -= numberOfItemsInRow
                    }
                    
                    gameBoardHandler.fallDownHandler?(
                        [gameBoardManager.gameBoard[currentIndex].indexPath,
                         gameBoardManager.gameBoard[currentIndex + 1].indexPath,
                         gameBoardManager.gameBoard[currentIndex + 2].indexPath,
                         gameBoardManager.gameBoard[currentIndex + 3].indexPath,
                         gameBoardManager.gameBoard[currentIndex + 4].indexPath
                        ])
                    
                    return true
                }
            }
        }
        
        return false
    }
    
    func checkFiveMatchAtColumn() -> Bool {
        let numberOfItemsInRow = gameBoardManager.numberOfItemsInRow
        
        for row in 0...gameBoardManager.gameBoard.count / numberOfItemsInRow - 5 {
            for column in 0...numberOfItemsInRow - 1 {
                
                let index = column + (row * numberOfItemsInRow)
                
                if gameBoardManager.gameBoard[index].id == gameBoardManager.gameBoard[index + numberOfItemsInRow].id &&
                    gameBoardManager.gameBoard[index].id == gameBoardManager.gameBoard[index + numberOfItemsInRow * 2].id &&
                    gameBoardManager.gameBoard[index].id == gameBoardManager.gameBoard[index + numberOfItemsInRow * 3].id &&
                    gameBoardManager.gameBoard[index].id == gameBoardManager.gameBoard[index + numberOfItemsInRow * 4].id
                {
                    
                    if gameBoardManager.gameBoard[index].id == gamePlayInfo.gameInstance.id {
                        gamePlayInfo.score -= 5
                        gamePlayInfo.updatedStarEstimation = 5 * (150 / gamePlayInfo.score)
                    }
                    
                    var currentIndex = index + numberOfItemsInRow * 4
                    
                    var firstInstance = GameInstanceCell.random()
                    firstInstance.indexPath = gameBoardManager.gameBoard[index].indexPath
                    
                    var secondInstance = GameInstanceCell.random()
                    secondInstance.indexPath = gameBoardManager.gameBoard[index + numberOfItemsInRow].indexPath
                    
                    var thiredInstance = GameInstanceCell.random()
                    thiredInstance.indexPath = gameBoardManager.gameBoard[index + numberOfItemsInRow * 2].indexPath
                    
                    var fourthInstance = GameInstanceCell.random()
                    fourthInstance.indexPath = gameBoardManager.gameBoard[index + numberOfItemsInRow * 3].indexPath
                    
                    var fifthInstance = GameInstanceCell.random()
                    fifthInstance.indexPath = gameBoardManager.gameBoard[index + numberOfItemsInRow * 4].indexPath
                    
                    gameBoardManager.gameBoard[index] = firstInstance
                    gameBoardManager.gameBoard[index + numberOfItemsInRow] = secondInstance
                    gameBoardManager.gameBoard[index + numberOfItemsInRow * 2] = thiredInstance
                    gameBoardManager.gameBoard[index + numberOfItemsInRow * 3] = fourthInstance
                    gameBoardManager.gameBoard[index + numberOfItemsInRow * 4] = fifthInstance
                    
                    while currentIndex >= numberOfItemsInRow * 5 {
                        gameBoardManager.gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow * 4)
                        
                        let firstTempIndexPath = gameBoardManager.gameBoard[currentIndex].indexPath
                        gameBoardManager.gameBoard[currentIndex].indexPath = gameBoardManager.gameBoard[currentIndex - numberOfItemsInRow * 4].indexPath
                        gameBoardManager.gameBoard[currentIndex - numberOfItemsInRow * 4].indexPath = firstTempIndexPath
                        
                        gameBoardHandler.fallDownHandler?([gameBoardManager.gameBoard[currentIndex].indexPath, gameBoardManager.gameBoard[currentIndex - numberOfItemsInRow * 4].indexPath])
                        currentIndex -= numberOfItemsInRow
                    }
                    
                    gameBoardHandler.fallDownHandler?([gameBoardManager.gameBoard[index].indexPath,
                                                       gameBoardManager.gameBoard[index + numberOfItemsInRow].indexPath,
                                                       gameBoardManager.gameBoard[index + numberOfItemsInRow * 2].indexPath,
                                                       gameBoardManager.gameBoard[index + numberOfItemsInRow * 3].indexPath,
                                                       gameBoardManager.gameBoard[index + numberOfItemsInRow * 4].indexPath
                                                      ])
                    return true
                }
            }
        }
        
        return false
    }
    
    func checkFourMatchAtRow() -> Bool {
        let numberOfItemsInRow = gameBoardManager.numberOfItemsInRow
        
        for row in 0...gameBoardManager.gameBoard.count / numberOfItemsInRow - 1 {
            for column in 0...numberOfItemsInRow - 4 {
                
                let index = column + (row * numberOfItemsInRow)
                
                if gameBoardManager.gameBoard[index].id == gameBoardManager.gameBoard[index + 1].id &&
                    gameBoardManager.gameBoard[index].id == gameBoardManager.gameBoard[index + 2].id &&
                    gameBoardManager.gameBoard[index].id == gameBoardManager.gameBoard[index + 3].id {
                    
                    if gameBoardManager.gameBoard[index].id == gamePlayInfo.gameInstance.id {
                        gamePlayInfo.score -= 4
                        gamePlayInfo.updatedStarEstimation = 4 * (150 / gamePlayInfo.score)
                    }
                    
                    var currentIndex = index
                    
                    var firstInstance = GameInstanceCell.random()
                    firstInstance.indexPath = gameBoardManager.gameBoard[index].indexPath
                    
                    var secondInstance = GameInstanceCell.random()
                    secondInstance.indexPath = gameBoardManager.gameBoard[index + 1].indexPath
                    
                    var thiredInstance = GameInstanceCell.random()
                    thiredInstance.indexPath = gameBoardManager.gameBoard[index + 2].indexPath
                    
                    var fourthInstance = GameInstanceCell.random()
                    fourthInstance.indexPath = gameBoardManager.gameBoard[index + 3].indexPath
                    
                    gameBoardManager.gameBoard[index] = firstInstance
                    gameBoardManager.gameBoard[index + 1] = secondInstance
                    gameBoardManager.gameBoard[index + 2] = thiredInstance
                    gameBoardManager.gameBoard[index + 3] = fourthInstance
                    
                    while currentIndex >= numberOfItemsInRow {
                        gameBoardManager.gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow)
                        gameBoardManager.gameBoard.swapAt(currentIndex + 1, (currentIndex + 1) - numberOfItemsInRow)
                        gameBoardManager.gameBoard.swapAt(currentIndex + 2, (currentIndex + 2) - numberOfItemsInRow)
                        gameBoardManager.gameBoard.swapAt(currentIndex + 3, (currentIndex + 3) - numberOfItemsInRow)
                        
                        let firstTempIndexPath = gameBoardManager.gameBoard[currentIndex].indexPath
                        gameBoardManager.gameBoard[currentIndex].indexPath = gameBoardManager.gameBoard[currentIndex - numberOfItemsInRow].indexPath
                        gameBoardManager.gameBoard[currentIndex - numberOfItemsInRow].indexPath = firstTempIndexPath
                        
                        let secondTempIndexPath = gameBoardManager.gameBoard[currentIndex + 1].indexPath
                        gameBoardManager.gameBoard[currentIndex + 1].indexPath = gameBoardManager.gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath
                        gameBoardManager.gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath = secondTempIndexPath
                        
                        let thirdTempIndexPath = gameBoardManager.gameBoard[currentIndex + 2].indexPath
                        gameBoardManager.gameBoard[currentIndex + 2].indexPath = gameBoardManager.gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath
                        gameBoardManager.gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath = thirdTempIndexPath
                        
                        let fourthTempIndexPath = gameBoardManager.gameBoard[currentIndex + 3].indexPath
                        gameBoardManager.gameBoard[currentIndex + 3].indexPath = gameBoardManager.gameBoard[(currentIndex + 3) - numberOfItemsInRow].indexPath
                        gameBoardManager.gameBoard[(currentIndex + 3) - numberOfItemsInRow].indexPath = fourthTempIndexPath
                        
                        let indexPaths = [gameBoardManager.gameBoard[currentIndex].indexPath,
                                          gameBoardManager.gameBoard[currentIndex + 1].indexPath,
                                          gameBoardManager.gameBoard[currentIndex + 2].indexPath,
                                          gameBoardManager.gameBoard[currentIndex + 3].indexPath,
                                          gameBoardManager.gameBoard[currentIndex - numberOfItemsInRow].indexPath,
                                          gameBoardManager.gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath,
                                          gameBoardManager.gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath,
                                          gameBoardManager.gameBoard[(currentIndex + 3) - numberOfItemsInRow].indexPath
                        ]
                        
                        gameBoardHandler.fallDownHandler?(indexPaths)
                        currentIndex -= numberOfItemsInRow
                    }
                    
                    gameBoardHandler.fallDownHandler?([gameBoardManager.gameBoard[currentIndex].indexPath,
                                                       gameBoardManager.gameBoard[currentIndex + 1].indexPath,
                                                       gameBoardManager.gameBoard[currentIndex + 2].indexPath,
                                                       gameBoardManager.gameBoard[currentIndex + 3].indexPath
                                                      ])
                    
                    return true
                }
            }
        }
        
        return false
    }
    
    func checkFourMatchAtColumn() -> Bool {
        let numberOfItemsInRow = gameBoardManager.numberOfItemsInRow
        
        for row in 0...gameBoardManager.gameBoard.count / numberOfItemsInRow - 4 {
            for column in 0...numberOfItemsInRow - 1 {
                
                let index = column + (row * numberOfItemsInRow)
                
                if gameBoardManager.gameBoard[index].id == gameBoardManager.gameBoard[index + numberOfItemsInRow].id &&
                    gameBoardManager.gameBoard[index].id == gameBoardManager.gameBoard[index + numberOfItemsInRow * 2].id &&
                    gameBoardManager.gameBoard[index].id == gameBoardManager.gameBoard[index + numberOfItemsInRow * 3].id
                {
                    
                    if gameBoardManager.gameBoard[index].id == gamePlayInfo.gameInstance.id {
                        gamePlayInfo.score -= 4
                        gamePlayInfo.updatedStarEstimation = 4 * (150 / gamePlayInfo.score)
                    }
                    
                    var currentIndex = index + numberOfItemsInRow * 3
                    
                    var firstInstance = GameInstanceCell.random()
                    firstInstance.indexPath = gameBoardManager.gameBoard[index].indexPath
                    
                    var secondInstance = GameInstanceCell.random()
                    secondInstance.indexPath = gameBoardManager.gameBoard[index + numberOfItemsInRow].indexPath
                    
                    var thiredInstance = GameInstanceCell.random()
                    thiredInstance.indexPath = gameBoardManager.gameBoard[index + numberOfItemsInRow * 2].indexPath
                    
                    var fourthInstance = GameInstanceCell.random()
                    fourthInstance.indexPath = gameBoardManager.gameBoard[index + numberOfItemsInRow * 3].indexPath
                    
                    gameBoardManager.gameBoard[index] = firstInstance
                    gameBoardManager.gameBoard[index + numberOfItemsInRow] = secondInstance
                    gameBoardManager.gameBoard[index + numberOfItemsInRow * 2] = thiredInstance
                    gameBoardManager.gameBoard[index + numberOfItemsInRow * 3] = fourthInstance
                    
                    while currentIndex >= numberOfItemsInRow * 4 {
                        gameBoardManager.gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow * 4)
                        
                        let firstTempIndexPath = gameBoardManager.gameBoard[currentIndex].indexPath
                        gameBoardManager.gameBoard[currentIndex].indexPath = gameBoardManager.gameBoard[currentIndex - numberOfItemsInRow * 4].indexPath
                        gameBoardManager.gameBoard[currentIndex - numberOfItemsInRow * 4].indexPath = firstTempIndexPath
                        
                        gameBoardHandler.fallDownHandler?([gameBoardManager.gameBoard[currentIndex].indexPath, gameBoardManager.gameBoard[currentIndex - numberOfItemsInRow * 4].indexPath])
                        currentIndex -= numberOfItemsInRow
                    }
                    
                    gameBoardHandler.fallDownHandler?([gameBoardManager.gameBoard[index].indexPath,
                                                       gameBoardManager.gameBoard[index + numberOfItemsInRow].indexPath,
                                                       gameBoardManager.gameBoard[index + numberOfItemsInRow * 2].indexPath,
                                                       gameBoardManager.gameBoard[index + numberOfItemsInRow * 3].indexPath
                                                      ])
                    return true
                }
            }
        }
        
        return false
    }
    
    func checkThreeMatchAtRow() -> Bool {
        let numberOfItemsInRow = gameBoardManager.numberOfItemsInRow
        
        for row in 0...gameBoardManager.gameBoard.count / numberOfItemsInRow - 1 {
            for column in 0...numberOfItemsInRow - 3 {
                
                let index = column + (row * numberOfItemsInRow)
                
                if gameBoardManager.gameBoard[index].id == gameBoardManager.gameBoard[index + 1].id &&
                    gameBoardManager.gameBoard[index].id == gameBoardManager.gameBoard[index + 2].id
                {
                    
                    if gameBoardManager.gameBoard[index].id == gamePlayInfo.gameInstance.id {
                        gamePlayInfo.score -= 3
                        gamePlayInfo.updatedStarEstimation = 3 * (150 / gamePlayInfo.score)
                    }
                    
                    var currentIndex = index
                    
                    var firstInstance = GameInstanceCell.random()
                    firstInstance.indexPath = gameBoardManager.gameBoard[index].indexPath
                    
                    var secondInstance = GameInstanceCell.random()
                    secondInstance.indexPath = gameBoardManager.gameBoard[index + 1].indexPath
                    
                    var thiredInstance = GameInstanceCell.random()
                    thiredInstance.indexPath = gameBoardManager.gameBoard[index + 2].indexPath
                    
                    gameBoardManager.gameBoard[index] = firstInstance
                    gameBoardManager.gameBoard[index + 1] = secondInstance
                    gameBoardManager.gameBoard[index + 2] = thiredInstance
                    
                    
                    while currentIndex >= numberOfItemsInRow {
                        gameBoardManager.gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow)
                        gameBoardManager.gameBoard.swapAt(currentIndex + 1, (currentIndex + 1) - numberOfItemsInRow)
                        gameBoardManager.gameBoard.swapAt(currentIndex + 2, (currentIndex + 2) - numberOfItemsInRow)
                        
                        let firstTempIndexPath = gameBoardManager.gameBoard[currentIndex].indexPath
                        gameBoardManager.gameBoard[currentIndex].indexPath = gameBoardManager.gameBoard[currentIndex - numberOfItemsInRow].indexPath
                        gameBoardManager.gameBoard[currentIndex - numberOfItemsInRow].indexPath = firstTempIndexPath
                        
                        let secondTempIndexPath = gameBoardManager.gameBoard[currentIndex + 1].indexPath
                        gameBoardManager.gameBoard[currentIndex + 1].indexPath = gameBoardManager.gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath
                        gameBoardManager.gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath = secondTempIndexPath
                        
                        let thirdTempIndexPath = gameBoardManager.gameBoard[currentIndex + 2].indexPath
                        gameBoardManager.gameBoard[currentIndex + 2].indexPath = gameBoardManager.gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath
                        gameBoardManager.gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath = thirdTempIndexPath
                        
                        let indexPaths = [gameBoardManager.gameBoard[currentIndex].indexPath,
                                          gameBoardManager.gameBoard[currentIndex + 1].indexPath,
                                          gameBoardManager.gameBoard[currentIndex + 2].indexPath,
                                          gameBoardManager.gameBoard[currentIndex - numberOfItemsInRow].indexPath,
                                          gameBoardManager.gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath,
                                          gameBoardManager.gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath,
                        ]
                        
                        gameBoardHandler.fallDownHandler?(indexPaths)
                        currentIndex -= numberOfItemsInRow
                    }
                    
                    gameBoardHandler.fallDownHandler?([gameBoardManager.gameBoard[currentIndex].indexPath,
                                                       gameBoardManager.gameBoard[currentIndex + 1].indexPath,
                                                       gameBoardManager.gameBoard[currentIndex + 2].indexPath
                                     ])
                    
                    return true
                }
            }
        }
        
        return false
    }
    
    func checkThreeMatchAtColumn() -> Bool {
        let numberOfItemsInRow = gameBoardManager.numberOfItemsInRow
        
        for row in 0...gameBoardManager.gameBoard.count / numberOfItemsInRow - 3 {
            for column in 0...numberOfItemsInRow - 1 {
                
                let index = column + (row * numberOfItemsInRow)
                
                if gameBoardManager.gameBoard[index].id == gameBoardManager.gameBoard[index + numberOfItemsInRow].id &&
                    gameBoardManager.gameBoard[index].id == gameBoardManager.gameBoard[index + numberOfItemsInRow * 2].id
                {
                    
                    if gameBoardManager.gameBoard[index].id == gamePlayInfo.gameInstance.id {
                        gamePlayInfo.score -= 3
                        gamePlayInfo.updatedStarEstimation = 3 * (150 / gamePlayInfo.score)
                    }
                    
                    var currentIndex = index + numberOfItemsInRow * 2
                    
                    var firstInstance = GameInstanceCell.random()
                    firstInstance.indexPath = gameBoardManager.gameBoard[index].indexPath
                    
                    var secondInstance = GameInstanceCell.random()
                    secondInstance.indexPath = gameBoardManager.gameBoard[index + numberOfItemsInRow].indexPath
                    
                    var thiredInstance = GameInstanceCell.random()
                    thiredInstance.indexPath = gameBoardManager.gameBoard[index + numberOfItemsInRow * 2].indexPath
                    
                    gameBoardManager.gameBoard[index] = firstInstance
                    gameBoardManager.gameBoard[index + numberOfItemsInRow] = secondInstance
                    gameBoardManager.gameBoard[index + numberOfItemsInRow * 2] = thiredInstance
                    
                    
                    while currentIndex >= numberOfItemsInRow * 3 {
                        gameBoardManager.gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow * 3)
                        
                        let firstTempIndexPath = gameBoardManager.gameBoard[currentIndex].indexPath
                        gameBoardManager.gameBoard[currentIndex].indexPath = gameBoardManager.gameBoard[currentIndex - numberOfItemsInRow * 3].indexPath
                        gameBoardManager.gameBoard[currentIndex - numberOfItemsInRow * 3].indexPath = firstTempIndexPath
                        
                        gameBoardHandler.fallDownHandler?([gameBoardManager.gameBoard[currentIndex].indexPath,
                                                           gameBoardManager.gameBoard[currentIndex - numberOfItemsInRow * 3].indexPath])
                        currentIndex -= numberOfItemsInRow
                    }
                    
                    gameBoardHandler.fallDownHandler?([gameBoardManager.gameBoard[index].indexPath,
                                                       gameBoardManager.gameBoard[index + numberOfItemsInRow].indexPath,
                                                       gameBoardManager.gameBoard[index + numberOfItemsInRow * 2].indexPath
                                     ])
                    return true
                }
            }
        }
        
        return false
    }
    
    func checkMatches() {
        isMatch = true
        
        while isMatch {
            isMatch = false
            
            if checkFiveMatchAtRow() {
                isMatch = true
            } else if checkFiveMatchAtColumn() {
                isMatch = true
            } else if checkFourMatchAtRow() {
                isMatch = true
            } else if checkFourMatchAtColumn() {
                isMatch = true
            } else if checkThreeMatchAtRow() {
                isMatch = true
            } else if checkThreeMatchAtColumn() {
                isMatch = true
            }
        }
    }
    
    func checkMatchForSwipeGesture() -> Bool {
        if checkFiveMatchAtRow() {
            return true
        } else if checkFiveMatchAtColumn() {
            return true
        } else if checkFourMatchAtRow() {
            return true
        } else if checkFourMatchAtColumn() {
            return true
        } else if checkThreeMatchAtRow() {
            return true
        } else if checkThreeMatchAtColumn() {
            return true
        }
        
        return false
    }
}
