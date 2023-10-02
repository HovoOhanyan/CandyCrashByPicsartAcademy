//
//  GameEngineCheckMeneger.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 30.09.23.
//

import Foundation

final class GameEngineCheckManager: GameEngineCheckMatches {
    private let gameBoardMeneger: GameEngineBoard!
    private let gameBoardHendler: GameEngineBoardChangeHendler!
    
    private var isMatch = true
    
    init(gameEngineBoardMeneger: GameEngineBoard,
         gameEngineBoardHendler: GameEngineBoardChangeHendler) {
        self.gameBoardMeneger = gameEngineBoardMeneger
        self.gameBoardHendler = gameEngineBoardHendler
    }
    
    func checkFiveMatchAtRow() -> Bool {
        let numberOfItemsInRow = gameBoardMeneger.numberOfItemsInRow
        
        for row in 0...gameBoardMeneger.gameBoard.count / numberOfItemsInRow - 1 {
            for column in 0...gameBoardMeneger.numberOfItemsInRow - 5 {
                
                let index = column + (row * numberOfItemsInRow)
                
                if gameBoardMeneger.gameBoard[index].id == gameBoardMeneger.gameBoard[index + 1].id &&
                    gameBoardMeneger.gameBoard[index].id == gameBoardMeneger.gameBoard[index + 2].id &&
                    gameBoardMeneger.gameBoard[index].id == gameBoardMeneger.gameBoard[index + 3].id &&
                    gameBoardMeneger.gameBoard[index].id ==  gameBoardMeneger.gameBoard[index + 4].id
                {
                    
                    var currentIndex = index
                    
                    var firstInstance = EmptyInstance()
                    firstInstance.indexPath = gameBoardMeneger.gameBoard[index].indexPath
                    
                    var secondInstance = EmptyInstance()
                    secondInstance.indexPath = gameBoardMeneger.gameBoard[index + 1].indexPath
                    
                    var thiredInstance = EmptyInstance()
                    thiredInstance.indexPath = gameBoardMeneger.gameBoard[index + 2].indexPath
                    
                    var fourthInstance = EmptyInstance()
                    fourthInstance.indexPath = gameBoardMeneger.gameBoard[index + 3].indexPath
                    
                    var fifthIstance = EmptyInstance()
                    fifthIstance.indexPath = gameBoardMeneger.gameBoard[index + 4].indexPath
                    
                    gameBoardMeneger.gameBoard[index] = firstInstance
                    gameBoardMeneger.gameBoard[index + 1] = secondInstance
                    gameBoardMeneger.gameBoard[index + 2] = thiredInstance
                    gameBoardMeneger.gameBoard[index + 3] = fourthInstance
                    gameBoardMeneger.gameBoard[index + 4] = fifthIstance
                    
                    while currentIndex >= numberOfItemsInRow {
                        gameBoardMeneger.gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow)
                        gameBoardMeneger.gameBoard.swapAt(currentIndex + 1, (currentIndex + 1) - numberOfItemsInRow)
                        gameBoardMeneger.gameBoard.swapAt(currentIndex + 2, (currentIndex + 2) - numberOfItemsInRow)
                        gameBoardMeneger.gameBoard.swapAt(currentIndex + 3, (currentIndex + 3) - numberOfItemsInRow)
                        gameBoardMeneger.gameBoard.swapAt(currentIndex + 4, (currentIndex + 4) - numberOfItemsInRow)
                        
                        let firstTempIndexPath = gameBoardMeneger.gameBoard[currentIndex].indexPath
                        gameBoardMeneger.gameBoard[currentIndex].indexPath = gameBoardMeneger.gameBoard[currentIndex - numberOfItemsInRow].indexPath
                        gameBoardMeneger.gameBoard[currentIndex - numberOfItemsInRow].indexPath = firstTempIndexPath
                        
                        let secondTempIndexPath = gameBoardMeneger.gameBoard[currentIndex + 1].indexPath
                        gameBoardMeneger.gameBoard[currentIndex + 1].indexPath = gameBoardMeneger.gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath
                        gameBoardMeneger.gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath = secondTempIndexPath
                        
                        let thirdTempIndexPath = gameBoardMeneger.gameBoard[currentIndex + 2].indexPath
                        gameBoardMeneger.gameBoard[currentIndex + 2].indexPath = gameBoardMeneger.gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath
                        gameBoardMeneger.gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath = thirdTempIndexPath
                        
                        let fourthTempIndexPath = gameBoardMeneger.gameBoard[currentIndex + 3].indexPath
                        gameBoardMeneger.gameBoard[currentIndex + 3].indexPath = gameBoardMeneger.gameBoard[(currentIndex + 3) - numberOfItemsInRow].indexPath
                        gameBoardMeneger.gameBoard[(currentIndex + 3) - numberOfItemsInRow].indexPath = fourthTempIndexPath
                        
                        let fifthTempIndexPath = gameBoardMeneger.gameBoard[currentIndex + 4].indexPath
                        gameBoardMeneger.gameBoard[currentIndex + 4].indexPath = gameBoardMeneger.gameBoard[(currentIndex + 4) - numberOfItemsInRow].indexPath
                        gameBoardMeneger.gameBoard[(currentIndex + 4) - numberOfItemsInRow].indexPath = fifthTempIndexPath
                        
                        let indexPaths = [gameBoardMeneger.gameBoard[currentIndex].indexPath,
                                          gameBoardMeneger.gameBoard[currentIndex + 1].indexPath,
                                          gameBoardMeneger.gameBoard[currentIndex + 2].indexPath,
                                          gameBoardMeneger.gameBoard[currentIndex + 3].indexPath,
                                          gameBoardMeneger.gameBoard[currentIndex + 4].indexPath,
                                          gameBoardMeneger.gameBoard[currentIndex - numberOfItemsInRow].indexPath,
                                          gameBoardMeneger.gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath,
                                          gameBoardMeneger.gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath,
                                          gameBoardMeneger.gameBoard[(currentIndex + 3) - numberOfItemsInRow].indexPath,
                                          gameBoardMeneger.gameBoard[(currentIndex + 4) - numberOfItemsInRow].indexPath
                        ]
                        
                        gameBoardHendler.fallDownHendler?(indexPaths)
                        currentIndex -= numberOfItemsInRow
                    }
                    
                    gameBoardHendler.fallDownHendler?(
                        [gameBoardMeneger.gameBoard[currentIndex].indexPath,
                         gameBoardMeneger.gameBoard[currentIndex + 1].indexPath,
                         gameBoardMeneger.gameBoard[currentIndex + 2].indexPath,
                         gameBoardMeneger.gameBoard[currentIndex + 3].indexPath,
                         gameBoardMeneger.gameBoard[currentIndex + 4].indexPath
                        ])
                    
                           return true
                       }
                   }
               }
       
               return false
    }
    
    func checkFiveMatchAtColumn() -> Bool {
        let numberOfItemsInRow = gameBoardMeneger.numberOfItemsInRow
        
        for row in 0...gameBoardMeneger.gameBoard.count / numberOfItemsInRow - 5 {
            for column in 0...numberOfItemsInRow - 1 {
                
                let index = column + (row * numberOfItemsInRow)
                
                if gameBoardMeneger.gameBoard[index].id == gameBoardMeneger.gameBoard[index + numberOfItemsInRow].id &&
                    gameBoardMeneger.gameBoard[index].id == gameBoardMeneger.gameBoard[index + numberOfItemsInRow * 2].id &&
                    gameBoardMeneger.gameBoard[index].id == gameBoardMeneger.gameBoard[index + numberOfItemsInRow * 3].id &&
                    gameBoardMeneger.gameBoard[index].id == gameBoardMeneger.gameBoard[index + numberOfItemsInRow * 4].id
                {
                    
                    var currentIndex = index + numberOfItemsInRow * 4
                    
                    var firstInstance = GameInstanceCell.random()
                    firstInstance.indexPath = gameBoardMeneger.gameBoard[index].indexPath
                    
                    var secondInstance = GameInstanceCell.random()
                    secondInstance.indexPath = gameBoardMeneger.gameBoard[index + numberOfItemsInRow].indexPath
                    
                    var thiredInstance = GameInstanceCell.random()
                    thiredInstance.indexPath = gameBoardMeneger.gameBoard[index + numberOfItemsInRow * 2].indexPath
                    
                    var fourthInstance = GameInstanceCell.random()
                    fourthInstance.indexPath = gameBoardMeneger.gameBoard[index + numberOfItemsInRow * 3].indexPath
                    
                    var fifthInstance = GameInstanceCell.random()
                    fifthInstance.indexPath = gameBoardMeneger.gameBoard[index + numberOfItemsInRow * 4].indexPath
                    
                    gameBoardMeneger.gameBoard[index] = firstInstance
                    gameBoardMeneger.gameBoard[index + numberOfItemsInRow] = secondInstance
                    gameBoardMeneger.gameBoard[index + numberOfItemsInRow * 2] = thiredInstance
                    gameBoardMeneger.gameBoard[index + numberOfItemsInRow * 3] = fourthInstance
                    gameBoardMeneger.gameBoard[index + numberOfItemsInRow * 4] = fifthInstance
                    
                    while currentIndex >= numberOfItemsInRow * 5 {
                        gameBoardMeneger.gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow * 4)
                        
                        let firstTempIndexPath = gameBoardMeneger.gameBoard[currentIndex].indexPath
                        gameBoardMeneger.gameBoard[currentIndex].indexPath = gameBoardMeneger.gameBoard[currentIndex - numberOfItemsInRow * 4].indexPath
                        gameBoardMeneger.gameBoard[currentIndex - numberOfItemsInRow * 4].indexPath = firstTempIndexPath
                        
                        gameBoardHendler.fallDownHendler?([gameBoardMeneger.gameBoard[currentIndex].indexPath, gameBoardMeneger.gameBoard[currentIndex - numberOfItemsInRow * 4].indexPath])
                        currentIndex -= numberOfItemsInRow
                    }
                    
                    gameBoardHendler.fallDownHendler?([gameBoardMeneger.gameBoard[index].indexPath,
                                      gameBoardMeneger.gameBoard[index + numberOfItemsInRow].indexPath,
                                      gameBoardMeneger.gameBoard[index + numberOfItemsInRow * 2].indexPath,
                                      gameBoardMeneger.gameBoard[index + numberOfItemsInRow * 3].indexPath,
                                      gameBoardMeneger.gameBoard[index + numberOfItemsInRow * 4].indexPath
                                     ])
                    return true
                }
            }
        }
        
        return false
    }
    
    func checkFourMatchAtRow() -> Bool {
        let numberOfItemsInRow = gameBoardMeneger.numberOfItemsInRow
        
        for row in 0...gameBoardMeneger.gameBoard.count / numberOfItemsInRow - 1 {
            for column in 0...numberOfItemsInRow - 4 {
                
                let index = column + (row * numberOfItemsInRow)
                
                if gameBoardMeneger.gameBoard[index].id == gameBoardMeneger.gameBoard[index + 1].id &&
                    gameBoardMeneger.gameBoard[index].id == gameBoardMeneger.gameBoard[index + 2].id &&
                    gameBoardMeneger.gameBoard[index].id == gameBoardMeneger.gameBoard[index + 3].id {
                    
                    var currentIndex = index
                    
                    var firstInstance = GameInstanceCell.random()
                    firstInstance.indexPath = gameBoardMeneger.gameBoard[index].indexPath
                    
                    var secondInstance = GameInstanceCell.random()
                    secondInstance.indexPath = gameBoardMeneger.gameBoard[index + 1].indexPath
                    
                    var thiredInstance = GameInstanceCell.random()
                    thiredInstance.indexPath = gameBoardMeneger.gameBoard[index + 2].indexPath
                    
                    var fourthInstance = GameInstanceCell.random()
                    fourthInstance.indexPath = gameBoardMeneger.gameBoard[index + 3].indexPath
                    
                    gameBoardMeneger.gameBoard[index] = firstInstance
                    gameBoardMeneger.gameBoard[index + 1] = secondInstance
                    gameBoardMeneger.gameBoard[index + 2] = thiredInstance
                    gameBoardMeneger.gameBoard[index + 3] = fourthInstance
                    
                    while currentIndex >= numberOfItemsInRow {
                        gameBoardMeneger.gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow)
                        gameBoardMeneger.gameBoard.swapAt(currentIndex + 1, (currentIndex + 1) - numberOfItemsInRow)
                        gameBoardMeneger.gameBoard.swapAt(currentIndex + 2, (currentIndex + 2) - numberOfItemsInRow)
                        gameBoardMeneger.gameBoard.swapAt(currentIndex + 3, (currentIndex + 3) - numberOfItemsInRow)
                        
                        let firstTempIndexPath = gameBoardMeneger.gameBoard[currentIndex].indexPath
                        gameBoardMeneger.gameBoard[currentIndex].indexPath = gameBoardMeneger.gameBoard[currentIndex - numberOfItemsInRow].indexPath
                        gameBoardMeneger.gameBoard[currentIndex - numberOfItemsInRow].indexPath = firstTempIndexPath
                        
                        let secondTempIndexPath = gameBoardMeneger.gameBoard[currentIndex + 1].indexPath
                        gameBoardMeneger.gameBoard[currentIndex + 1].indexPath = gameBoardMeneger.gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath
                        gameBoardMeneger.gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath = secondTempIndexPath
                        
                        let thirdTempIndexPath = gameBoardMeneger.gameBoard[currentIndex + 2].indexPath
                        gameBoardMeneger.gameBoard[currentIndex + 2].indexPath = gameBoardMeneger.gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath
                        gameBoardMeneger.gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath = thirdTempIndexPath
                        
                        let fourthTempIndexPath = gameBoardMeneger.gameBoard[currentIndex + 3].indexPath
                        gameBoardMeneger.gameBoard[currentIndex + 3].indexPath = gameBoardMeneger.gameBoard[(currentIndex + 3) - numberOfItemsInRow].indexPath
                        gameBoardMeneger.gameBoard[(currentIndex + 3) - numberOfItemsInRow].indexPath = fourthTempIndexPath
                        
                        let indexPaths = [gameBoardMeneger.gameBoard[currentIndex].indexPath,
                                          gameBoardMeneger.gameBoard[currentIndex + 1].indexPath,
                                          gameBoardMeneger.gameBoard[currentIndex + 2].indexPath,
                                          gameBoardMeneger.gameBoard[currentIndex + 3].indexPath,
                                          gameBoardMeneger.gameBoard[currentIndex - numberOfItemsInRow].indexPath,
                                          gameBoardMeneger.gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath,
                                          gameBoardMeneger.gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath,
                                          gameBoardMeneger.gameBoard[(currentIndex + 3) - numberOfItemsInRow].indexPath
                        ]
                        
                        gameBoardHendler.fallDownHendler?(indexPaths)
                        currentIndex -= numberOfItemsInRow
                    }
                    
                    gameBoardHendler.fallDownHendler?([gameBoardMeneger.gameBoard[currentIndex].indexPath,
                                                       gameBoardMeneger.gameBoard[currentIndex + 1].indexPath,
                                                       gameBoardMeneger.gameBoard[currentIndex + 2].indexPath,
                                                       gameBoardMeneger.gameBoard[currentIndex + 3].indexPath
                                                      ])
                    
                    return true
                }
            }
        }
        
        return false
    }
    
    func checkFourMatchAtColumn() -> Bool {
        let numberOfItemsInRow = gameBoardMeneger.numberOfItemsInRow
        
        for row in 0...gameBoardMeneger.gameBoard.count / numberOfItemsInRow - 4 {
            for column in 0...numberOfItemsInRow - 1 {
                
                let index = column + (row * numberOfItemsInRow)
                
                if gameBoardMeneger.gameBoard[index].id == gameBoardMeneger.gameBoard[index + numberOfItemsInRow].id &&
                    gameBoardMeneger.gameBoard[index].id == gameBoardMeneger.gameBoard[index + numberOfItemsInRow * 2].id &&
                    gameBoardMeneger.gameBoard[index].id == gameBoardMeneger.gameBoard[index + numberOfItemsInRow * 3].id
                {
                    
                    var currentIndex = index + numberOfItemsInRow * 3
                    
                    var firstInstance = GameInstanceCell.random()
                    firstInstance.indexPath = gameBoardMeneger.gameBoard[index].indexPath
                    
                    var secondInstance = GameInstanceCell.random()
                    secondInstance.indexPath = gameBoardMeneger.gameBoard[index + numberOfItemsInRow].indexPath
                    
                    var thiredInstance = GameInstanceCell.random()
                    thiredInstance.indexPath = gameBoardMeneger.gameBoard[index + numberOfItemsInRow * 2].indexPath
                    
                    var fourthInstance = GameInstanceCell.random()
                    fourthInstance.indexPath = gameBoardMeneger.gameBoard[index + numberOfItemsInRow * 3].indexPath
                    
                    gameBoardMeneger.gameBoard[index] = firstInstance
                    gameBoardMeneger.gameBoard[index + numberOfItemsInRow] = secondInstance
                    gameBoardMeneger.gameBoard[index + numberOfItemsInRow * 2] = thiredInstance
                    gameBoardMeneger.gameBoard[index + numberOfItemsInRow * 3] = fourthInstance
                    
                    while currentIndex >= numberOfItemsInRow * 4 {
                        gameBoardMeneger.gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow * 4)
                        
                        let firstTempIndexPath = gameBoardMeneger.gameBoard[currentIndex].indexPath
                        gameBoardMeneger.gameBoard[currentIndex].indexPath = gameBoardMeneger.gameBoard[currentIndex - numberOfItemsInRow * 4].indexPath
                        gameBoardMeneger.gameBoard[currentIndex - numberOfItemsInRow * 4].indexPath = firstTempIndexPath
                        
                        gameBoardHendler.fallDownHendler?([gameBoardMeneger.gameBoard[currentIndex].indexPath, gameBoardMeneger.gameBoard[currentIndex - numberOfItemsInRow * 4].indexPath])
                        currentIndex -= numberOfItemsInRow
                    }
                    
                    gameBoardHendler.fallDownHendler?([gameBoardMeneger.gameBoard[index].indexPath,
                                                       gameBoardMeneger.gameBoard[index + numberOfItemsInRow].indexPath,
                                                       gameBoardMeneger.gameBoard[index + numberOfItemsInRow * 2].indexPath,
                                                       gameBoardMeneger.gameBoard[index + numberOfItemsInRow * 3].indexPath
                                                      ])
                    return true
                }
            }
        }
        
        return false
    }
    
    func checkThreeMatchAtRow() -> Bool {
        let numberOfItemsInRow = gameBoardMeneger.numberOfItemsInRow
        
        for row in 0...gameBoardMeneger.gameBoard.count / numberOfItemsInRow - 1 {
            for column in 0...numberOfItemsInRow - 3 {
                
                let index = column + (row * numberOfItemsInRow)
                
                if gameBoardMeneger.gameBoard[index].id == gameBoardMeneger.gameBoard[index + 1].id &&
                    gameBoardMeneger.gameBoard[index].id == gameBoardMeneger.gameBoard[index + 2].id
                {
                    
                    var currentIndex = index
                    
                    var firstInstance = GameInstanceCell.random()
                    firstInstance.indexPath = gameBoardMeneger.gameBoard[index].indexPath
                    
                    var secondInstance = GameInstanceCell.random()
                    secondInstance.indexPath = gameBoardMeneger.gameBoard[index + 1].indexPath
                    
                    var thiredInstance = GameInstanceCell.random()
                    thiredInstance.indexPath = gameBoardMeneger.gameBoard[index + 2].indexPath
                    
                    gameBoardMeneger.gameBoard[index] = firstInstance
                    gameBoardMeneger.gameBoard[index + 1] = secondInstance
                    gameBoardMeneger.gameBoard[index + 2] = thiredInstance
                    
                    
                    while currentIndex >= numberOfItemsInRow {
                        gameBoardMeneger.gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow)
                        gameBoardMeneger.gameBoard.swapAt(currentIndex + 1, (currentIndex + 1) - numberOfItemsInRow)
                        gameBoardMeneger.gameBoard.swapAt(currentIndex + 2, (currentIndex + 2) - numberOfItemsInRow)
                        
                        let firstTempIndexPath = gameBoardMeneger.gameBoard[currentIndex].indexPath
                        gameBoardMeneger.gameBoard[currentIndex].indexPath = gameBoardMeneger.gameBoard[currentIndex - numberOfItemsInRow].indexPath
                        gameBoardMeneger.gameBoard[currentIndex - numberOfItemsInRow].indexPath = firstTempIndexPath
                        
                        let secondTempIndexPath = gameBoardMeneger.gameBoard[currentIndex + 1].indexPath
                        gameBoardMeneger.gameBoard[currentIndex + 1].indexPath = gameBoardMeneger.gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath
                        gameBoardMeneger.gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath = secondTempIndexPath
                        
                        let thirdTempIndexPath = gameBoardMeneger.gameBoard[currentIndex + 2].indexPath
                        gameBoardMeneger.gameBoard[currentIndex + 2].indexPath = gameBoardMeneger.gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath
                        gameBoardMeneger.gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath = thirdTempIndexPath
                        
                        let indexPaths = [gameBoardMeneger.gameBoard[currentIndex].indexPath,
                                          gameBoardMeneger.gameBoard[currentIndex + 1].indexPath,
                                          gameBoardMeneger.gameBoard[currentIndex + 2].indexPath,
                                          gameBoardMeneger.gameBoard[currentIndex - numberOfItemsInRow].indexPath,
                                          gameBoardMeneger.gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath,
                                          gameBoardMeneger.gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath,
                        ]
                        
                        gameBoardHendler.fallDownHendler?(indexPaths)
                        currentIndex -= numberOfItemsInRow
                    }
                    
                    gameBoardHendler.fallDownHendler?([gameBoardMeneger.gameBoard[currentIndex].indexPath,
                                      gameBoardMeneger.gameBoard[currentIndex + 1].indexPath,
                                      gameBoardMeneger.gameBoard[currentIndex + 2].indexPath
                                     ])
                    
                    return true
                }
            }
        }
        
        return false
    }
    
    func checkThreeMatchAtColumn() -> Bool {
        let numberOfItemsInRow = gameBoardMeneger.numberOfItemsInRow
        
        for row in 0...gameBoardMeneger.gameBoard.count / numberOfItemsInRow - 3 {
            for column in 0...numberOfItemsInRow - 1 {
                
                let index = column + (row * numberOfItemsInRow)
                
                if gameBoardMeneger.gameBoard[index].id == gameBoardMeneger.gameBoard[index + numberOfItemsInRow].id &&
                    gameBoardMeneger.gameBoard[index].id == gameBoardMeneger.gameBoard[index + numberOfItemsInRow * 2].id
                {
                    
                    var currentIndex = index + numberOfItemsInRow * 2
                    
                    var firstInstance = GameInstanceCell.random()
                    firstInstance.indexPath = gameBoardMeneger.gameBoard[index].indexPath
                    
                    var secondInstance = GameInstanceCell.random()
                    secondInstance.indexPath = gameBoardMeneger.gameBoard[index + numberOfItemsInRow].indexPath
                    
                    var thiredInstance = GameInstanceCell.random()
                    thiredInstance.indexPath = gameBoardMeneger.gameBoard[index + numberOfItemsInRow * 2].indexPath
                    
                    gameBoardMeneger.gameBoard[index] = firstInstance
                    gameBoardMeneger.gameBoard[index + numberOfItemsInRow] = secondInstance
                    gameBoardMeneger.gameBoard[index + numberOfItemsInRow * 2] = thiredInstance
                    
                    
                    while currentIndex >= numberOfItemsInRow * 3 {
                        gameBoardMeneger.gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow * 3)
                        
                        let firstTempIndexPath = gameBoardMeneger.gameBoard[currentIndex].indexPath
                        gameBoardMeneger.gameBoard[currentIndex].indexPath = gameBoardMeneger.gameBoard[currentIndex - numberOfItemsInRow * 3].indexPath
                        gameBoardMeneger.gameBoard[currentIndex - numberOfItemsInRow * 3].indexPath = firstTempIndexPath
                        
                        gameBoardHendler.fallDownHendler?([gameBoardMeneger.gameBoard[currentIndex].indexPath, gameBoardMeneger.gameBoard[currentIndex - numberOfItemsInRow * 3].indexPath])
                        currentIndex -= numberOfItemsInRow
                    }
                    
                    gameBoardHendler.fallDownHendler?([gameBoardMeneger.gameBoard[index].indexPath,
                                      gameBoardMeneger.gameBoard[index + numberOfItemsInRow].indexPath,
                                      gameBoardMeneger.gameBoard[index + numberOfItemsInRow * 2].indexPath
                                     ])
                    return true
                }
            }
        }
        
        return false
    }
    
    func checkMathes() {
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
}
