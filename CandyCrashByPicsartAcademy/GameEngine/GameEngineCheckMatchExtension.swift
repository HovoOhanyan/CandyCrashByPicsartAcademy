//
//  GameEngineCheckMatchExtension.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 27.09.23.
//
//
//import Foundation
//
//extension GameEngine {
//    public func checkFiveMatchAtRow() -> Bool {
//        for row in 0...gameBoard.count / numberOfItemsInRow - 1 {
//            for column in 0...numberOfItemsInRow - 5 {
//                
//                let index = column + (row * numberOfItemsInRow)
//                
//                if gameBoard[index].id == gameBoard[index + 1].id &&
//                    gameBoard[index].id == gameBoard[index + 2].id &&
//                    gameBoard[index].id == gameBoard[index + 3].id &&
//                    gameBoard[index].id ==  gameBoard[index + 4].id
//                {
//                                        
//                    var currentIndex = index
//                    
//                    var firstInstance = EmptyInstance()
//                    firstInstance.indexPath = gameBoard[index].indexPath
//                    
//                    var secondInstance = EmptyInstance()
//                    secondInstance.indexPath = gameBoard[index + 1].indexPath
//                    
//                    var thiredInstance = EmptyInstance()
//                    thiredInstance.indexPath = gameBoard[index + 2].indexPath
//                    
//                    var fourthInstance = EmptyInstance()
//                    fourthInstance.indexPath = gameBoard[index + 3].indexPath
//                    
//                    var fifthIstance = EmptyInstance()
//                    fifthIstance.indexPath = gameBoard[index + 4].indexPath
//                    
//                    gameBoard[index] = firstInstance
//                    gameBoard[index + 1] = secondInstance
//                    gameBoard[index + 2] = thiredInstance
//                    gameBoard[index + 3] = fourthInstance
//                    gameBoard[index + 4] = fifthIstance
//
//                    while currentIndex >= numberOfItemsInRow {
//                        gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow)
//                        gameBoard.swapAt(currentIndex + 1, (currentIndex + 1) - numberOfItemsInRow)
//                        gameBoard.swapAt(currentIndex + 2, (currentIndex + 2) - numberOfItemsInRow)
//                        gameBoard.swapAt(currentIndex + 3, (currentIndex + 3) - numberOfItemsInRow)
//                        gameBoard.swapAt(currentIndex + 4, (currentIndex + 4) - numberOfItemsInRow)
//
//                        let firstTempIndexPath = gameBoard[currentIndex].indexPath
//                        gameBoard[currentIndex].indexPath = gameBoard[currentIndex - numberOfItemsInRow].indexPath
//                        gameBoard[currentIndex - numberOfItemsInRow].indexPath = firstTempIndexPath
//                        
//                        let secondTempIndexPath = gameBoard[currentIndex + 1].indexPath
//                        gameBoard[currentIndex + 1].indexPath = gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath
//                        gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath = secondTempIndexPath
//                        
//                        let thirdTempIndexPath = gameBoard[currentIndex + 2].indexPath
//                        gameBoard[currentIndex + 2].indexPath = gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath
//                        gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath = thirdTempIndexPath
//                        
//                        let fourthTempIndexPath = gameBoard[currentIndex + 3].indexPath
//                        gameBoard[currentIndex + 3].indexPath = gameBoard[(currentIndex + 3) - numberOfItemsInRow].indexPath
//                        gameBoard[(currentIndex + 3) - numberOfItemsInRow].indexPath = fourthTempIndexPath
//                        
//                        let fifthTempIndexPath = gameBoard[currentIndex + 4].indexPath
//                        gameBoard[currentIndex + 4].indexPath = gameBoard[(currentIndex + 4) - numberOfItemsInRow].indexPath
//                        gameBoard[(currentIndex + 4) - numberOfItemsInRow].indexPath = fifthTempIndexPath
//                        
//                        let indexPaths = [gameBoard[currentIndex].indexPath,
//                                          gameBoard[currentIndex + 1].indexPath,
//                                          gameBoard[currentIndex + 2].indexPath,
//                                          gameBoard[currentIndex + 3].indexPath,
//                                          gameBoard[currentIndex + 4].indexPath,
//                                          gameBoard[currentIndex - numberOfItemsInRow].indexPath,
//                                          gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath,
//                                          gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath,
//                                          gameBoard[(currentIndex + 3) - numberOfItemsInRow].indexPath,
//                                          gameBoard[(currentIndex + 4) - numberOfItemsInRow].indexPath
//                        ]
//                        
//                        fallDownHendler?(indexPaths)
//                        currentIndex -= numberOfItemsInRow
//                    }
//                    
//                    fallDownHendler?([gameBoard[currentIndex].indexPath,
//                               gameBoard[currentIndex + 1].indexPath,
//                               gameBoard[currentIndex + 2].indexPath,
//                               gameBoard[currentIndex + 3].indexPath,
//                               gameBoard[currentIndex + 4].indexPath
//                              ])
//                    
//                    return true
//                }
//            }
//        }
//        
//        return false
//    }
//    public func checkFiveMatchAtColumn() -> Bool {
//        for row in 0...gameBoard.count / numberOfItemsInRow - 5 {
//            for column in 0...numberOfItemsInRow - 1 {
//                
//                let index = column + (row * numberOfItemsInRow)
//                
//                if gameBoard[index].id == gameBoard[index + numberOfItemsInRow].id &&
//                    gameBoard[index].id == gameBoard[index + numberOfItemsInRow * 2].id &&
//                    gameBoard[index].id == gameBoard[index + numberOfItemsInRow * 3].id &&
//                    gameBoard[index].id == gameBoard[index + numberOfItemsInRow * 4].id
//                {
//                    
//                    var currentIndex = index + numberOfItemsInRow * 4
//                    
//                    var firstInstance = GameInstanceCell.random()
//                    firstInstance.indexPath = gameBoard[index].indexPath
//                    
//                    var secondInstance = GameInstanceCell.random()
//                    secondInstance.indexPath = gameBoard[index + numberOfItemsInRow].indexPath
//                    
//                    var thiredInstance = GameInstanceCell.random()
//                    thiredInstance.indexPath = gameBoard[index + numberOfItemsInRow * 2].indexPath
//                    
//                    var fourthInstance = GameInstanceCell.random()
//                    fourthInstance.indexPath = gameBoard[index + numberOfItemsInRow * 3].indexPath
//                    
//                    var fifthInstance = GameInstanceCell.random()
//                    fifthInstance.indexPath = gameBoard[index + numberOfItemsInRow * 4].indexPath
//                    
//                    gameBoard[index] = firstInstance
//                    gameBoard[index + numberOfItemsInRow] = secondInstance
//                    gameBoard[index + numberOfItemsInRow * 2] = thiredInstance
//                    gameBoard[index + numberOfItemsInRow * 3] = fourthInstance
//                    gameBoard[index + numberOfItemsInRow * 4] = fifthInstance
//
//                    while currentIndex >= numberOfItemsInRow * 5 {
//                        gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow * 4)
//                        
//                        let firstTempIndexPath = gameBoard[currentIndex].indexPath
//                        gameBoard[currentIndex].indexPath = gameBoard[currentIndex - numberOfItemsInRow * 4].indexPath
//                        gameBoard[currentIndex - numberOfItemsInRow * 4].indexPath = firstTempIndexPath
//                        
//                        fallDownHendler?([gameBoard[currentIndex].indexPath, gameBoard[currentIndex - numberOfItemsInRow * 4].indexPath])
//                        currentIndex -= numberOfItemsInRow
//                    }
//                    
//                    fallDownHendler?([gameBoard[index].indexPath,
//                               gameBoard[index + numberOfItemsInRow].indexPath,
//                               gameBoard[index + numberOfItemsInRow * 2].indexPath,
//                               gameBoard[index + numberOfItemsInRow * 3].indexPath,
//                               gameBoard[index + numberOfItemsInRow * 4].indexPath
//                              ])
//                    return true
//                }
//            }
//        }
//        
//        return false
//    }
//    public func checkFourMatchAtRow() -> Bool {
//        for row in 0...gameBoard.count / numberOfItemsInRow - 1 {
//            for column in 0...numberOfItemsInRow - 4 {
//                
//                let index = column + (row * numberOfItemsInRow)
//                
//                if gameBoard[index].id == gameBoard[index + 1].id &&
//                    gameBoard[index].id == gameBoard[index + 2].id &&
//                    gameBoard[index].id == gameBoard[index + 3].id {
//                                        
//                    var currentIndex = index
//                    
//                    var firstInstance = GameInstanceCell.random()
//                    firstInstance.indexPath = gameBoard[index].indexPath
//                    
//                    var secondInstance = GameInstanceCell.random()
//                    secondInstance.indexPath = gameBoard[index + 1].indexPath
//                    
//                    var thiredInstance = GameInstanceCell.random()
//                    thiredInstance.indexPath = gameBoard[index + 2].indexPath
//                    
//                    var fourthInstance = GameInstanceCell.random()
//                    fourthInstance.indexPath = gameBoard[index + 3].indexPath
//                    
//                    gameBoard[index] = firstInstance
//                    gameBoard[index + 1] = secondInstance
//                    gameBoard[index + 2] = thiredInstance
//                    gameBoard[index + 3] = fourthInstance
//                    
//                    while currentIndex >= numberOfItemsInRow {
//                        gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow)
//                        gameBoard.swapAt(currentIndex + 1, (currentIndex + 1) - numberOfItemsInRow)
//                        gameBoard.swapAt(currentIndex + 2, (currentIndex + 2) - numberOfItemsInRow)
//                        gameBoard.swapAt(currentIndex + 3, (currentIndex + 3) - numberOfItemsInRow)
//                        
//                        let firstTempIndexPath = gameBoard[currentIndex].indexPath
//                        gameBoard[currentIndex].indexPath = gameBoard[currentIndex - numberOfItemsInRow].indexPath
//                        gameBoard[currentIndex - numberOfItemsInRow].indexPath = firstTempIndexPath
//                        
//                        let secondTempIndexPath = gameBoard[currentIndex + 1].indexPath
//                        gameBoard[currentIndex + 1].indexPath = gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath
//                        gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath = secondTempIndexPath
//                        
//                        let thirdTempIndexPath = gameBoard[currentIndex + 2].indexPath
//                        gameBoard[currentIndex + 2].indexPath = gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath
//                        gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath = thirdTempIndexPath
//                        
//                        let fourthTempIndexPath = gameBoard[currentIndex + 3].indexPath
//                        gameBoard[currentIndex + 3].indexPath = gameBoard[(currentIndex + 3) - numberOfItemsInRow].indexPath
//                        gameBoard[(currentIndex + 3) - numberOfItemsInRow].indexPath = fourthTempIndexPath
//                        
//                        let indexPaths = [gameBoard[currentIndex].indexPath,
//                                          gameBoard[currentIndex + 1].indexPath,
//                                          gameBoard[currentIndex + 2].indexPath,
//                                          gameBoard[currentIndex + 3].indexPath,
//                                          gameBoard[currentIndex - numberOfItemsInRow].indexPath,
//                                          gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath,
//                                          gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath,
//                                          gameBoard[(currentIndex + 3) - numberOfItemsInRow].indexPath
//                        ]
//                        
//                        fallDownHendler?(indexPaths)
//                        currentIndex -= numberOfItemsInRow
//                    }
//                    
//                    fallDownHendler?([gameBoard[currentIndex].indexPath,
//                               gameBoard[currentIndex + 1].indexPath,
//                               gameBoard[currentIndex + 2].indexPath,
//                               gameBoard[currentIndex + 3].indexPath
//                              ])
//                    
//                    return true
//                }
//            }
//        }
//        
//        return false
//    }
//    public func checkFourMatchAtColumn() -> Bool {
//        for row in 0...gameBoard.count / numberOfItemsInRow - 4 {
//            for column in 0...numberOfItemsInRow - 1 {
//                
//                let index = column + (row * numberOfItemsInRow)
//                
//                if gameBoard[index].id == gameBoard[index + numberOfItemsInRow].id &&
//                    gameBoard[index].id == gameBoard[index + numberOfItemsInRow * 2].id &&
//                    gameBoard[index].id == gameBoard[index + numberOfItemsInRow * 3].id
//                {
//                    
//                    var currentIndex = index + numberOfItemsInRow * 3
//                    
//                    var firstInstance = GameInstanceCell.random()
//                    firstInstance.indexPath = gameBoard[index].indexPath
//                    
//                    var secondInstance = GameInstanceCell.random()
//                    secondInstance.indexPath = gameBoard[index + numberOfItemsInRow].indexPath
//                    
//                    var thiredInstance = GameInstanceCell.random()
//                    thiredInstance.indexPath = gameBoard[index + numberOfItemsInRow * 2].indexPath
//                    
//                    var fourthInstance = GameInstanceCell.random()
//                    fourthInstance.indexPath = gameBoard[index + numberOfItemsInRow * 3].indexPath
//                    
//                    gameBoard[index] = firstInstance
//                    gameBoard[index + numberOfItemsInRow] = secondInstance
//                    gameBoard[index + numberOfItemsInRow * 2] = thiredInstance
//                    gameBoard[index + numberOfItemsInRow * 3] = fourthInstance
//                    
//                    while currentIndex >= numberOfItemsInRow * 4 {
//                        gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow * 4)
//                        
//                        let firstTempIndexPath = gameBoard[currentIndex].indexPath
//                        gameBoard[currentIndex].indexPath = gameBoard[currentIndex - numberOfItemsInRow * 4].indexPath
//                        gameBoard[currentIndex - numberOfItemsInRow * 4].indexPath = firstTempIndexPath
//                        
//                        fallDownHendler?([gameBoard[currentIndex].indexPath, gameBoard[currentIndex - numberOfItemsInRow * 4].indexPath])
//                        currentIndex -= numberOfItemsInRow
//                    }
//                    
//                    fallDownHendler?([gameBoard[index].indexPath,
//                               gameBoard[index + numberOfItemsInRow].indexPath,
//                               gameBoard[index + numberOfItemsInRow * 2].indexPath,
//                               gameBoard[index + numberOfItemsInRow * 3].indexPath
//                              ])
//                    return true
//                }
//            }
//        }
//        
//        return false
//    }
//    public func checkThreeMatchAtRow() -> Bool {
//        for row in 0...gameBoard.count / numberOfItemsInRow - 1 {
//            for column in 0...numberOfItemsInRow - 3 {
//                
//                let index = column + (row * numberOfItemsInRow)
//                
//                if gameBoard[index].id == gameBoard[index + 1].id &&
//                    gameBoard[index].id == gameBoard[index + 2].id
//                {
//                                        
//                    var currentIndex = index
//                    
//                    var firstInstance = GameInstanceCell.random()
//                    firstInstance.indexPath = gameBoard[index].indexPath
//                    
//                    var secondInstance = GameInstanceCell.random()
//                    secondInstance.indexPath = gameBoard[index + 1].indexPath
//                    
//                    var thiredInstance = GameInstanceCell.random()
//                    thiredInstance.indexPath = gameBoard[index + 2].indexPath
//                    
//                    gameBoard[index] = firstInstance
//                    gameBoard[index + 1] = secondInstance
//                    gameBoard[index + 2] = thiredInstance
//                    
//                    
//                    while currentIndex >= numberOfItemsInRow {
//                        gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow)
//                        gameBoard.swapAt(currentIndex + 1, (currentIndex + 1) - numberOfItemsInRow)
//                        gameBoard.swapAt(currentIndex + 2, (currentIndex + 2) - numberOfItemsInRow)
//                        
//                        let firstTempIndexPath = gameBoard[currentIndex].indexPath
//                        gameBoard[currentIndex].indexPath = gameBoard[currentIndex - numberOfItemsInRow].indexPath
//                        gameBoard[currentIndex - numberOfItemsInRow].indexPath = firstTempIndexPath
//                        
//                        let secondTempIndexPath = gameBoard[currentIndex + 1].indexPath
//                        gameBoard[currentIndex + 1].indexPath = gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath
//                        gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath = secondTempIndexPath
//                        
//                        let thirdTempIndexPath = gameBoard[currentIndex + 2].indexPath
//                        gameBoard[currentIndex + 2].indexPath = gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath
//                        gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath = thirdTempIndexPath
//                        
//                        let indexPaths = [gameBoard[currentIndex].indexPath,
//                                          gameBoard[currentIndex + 1].indexPath,
//                                          gameBoard[currentIndex + 2].indexPath,
//                                          gameBoard[currentIndex - numberOfItemsInRow].indexPath,
//                                          gameBoard[(currentIndex + 1) - numberOfItemsInRow].indexPath,
//                                          gameBoard[(currentIndex + 2) - numberOfItemsInRow].indexPath,
//                        ]
//                        
//                        fallDownHendler?(indexPaths)
//                        currentIndex -= numberOfItemsInRow
//                    }
//                    
//                    fallDownHendler?([gameBoard[currentIndex].indexPath,
//                               gameBoard[currentIndex + 1].indexPath,
//                               gameBoard[currentIndex + 2].indexPath
//                              ])
//                    
//                    return true
//                }
//            }
//        }
//        
//        return false
//    }
//    public func checkThreeMatchAtColumn() -> Bool {
//        for row in 0...gameBoard.count / numberOfItemsInRow - 3 {
//            for column in 0...numberOfItemsInRow - 1 {
//                
//                let index = column + (row * numberOfItemsInRow)
//                
//                if gameBoard[index].id == gameBoard[index + numberOfItemsInRow].id &&
//                    gameBoard[index].id == gameBoard[index + numberOfItemsInRow * 2].id
//                {
//                    
//                    var currentIndex = index + numberOfItemsInRow * 2
//                    
//                    var firstInstance = GameInstanceCell.random()
//                    firstInstance.indexPath = gameBoard[index].indexPath
//                    
//                    var secondInstance = GameInstanceCell.random()
//                    secondInstance.indexPath = gameBoard[index + numberOfItemsInRow].indexPath
//                    
//                    var thiredInstance = GameInstanceCell.random()
//                    thiredInstance.indexPath = gameBoard[index + numberOfItemsInRow * 2].indexPath
//                    
//                    gameBoard[index] = firstInstance
//                    gameBoard[index + numberOfItemsInRow] = secondInstance
//                    gameBoard[index + numberOfItemsInRow * 2] = thiredInstance
//                    
//                    
//                    while currentIndex >= numberOfItemsInRow * 3 {
//                        gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow * 3)
//                        
//                        let firstTempIndexPath = gameBoard[currentIndex].indexPath
//                        gameBoard[currentIndex].indexPath = gameBoard[currentIndex - numberOfItemsInRow * 3].indexPath
//                        gameBoard[currentIndex - numberOfItemsInRow * 3].indexPath = firstTempIndexPath
//                        
//                        fallDownHendler?([gameBoard[currentIndex].indexPath, gameBoard[currentIndex - numberOfItemsInRow * 3].indexPath])
//                        currentIndex -= numberOfItemsInRow
//                    }
//                    
//                    fallDownHendler?([gameBoard[index].indexPath,
//                               gameBoard[index + numberOfItemsInRow].indexPath,
//                               gameBoard[index + numberOfItemsInRow * 2].indexPath
//                              ])
//                    return true
//                }
//            }
//        }
//        
//        return false
//    }
//
//    func checkMatch() {
//        while isMatch {
//            isMatch = false
//            
//            if checkFiveMatchAtRow() {
//                isMatch = true
//                combo += 1
//            } else if checkFiveMatchAtColumn() {
//                isMatch = true
//                combo += 1
//            } else if checkFourMatchAtRow() {
//                isMatch = true
//                combo += 1
//            } else if checkFourMatchAtColumn() {
//                isMatch = true
//                combo += 1
//            } else if checkThreeMatchAtRow() {
//                isMatch = true
//                combo += 1
//            } else if checkThreeMatchAtColumn() {
//                isMatch = true
//                combo += 1
//            }
//        }
//    }
//}
//
