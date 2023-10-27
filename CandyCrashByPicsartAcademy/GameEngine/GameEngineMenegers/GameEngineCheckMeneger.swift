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
    var gamePlayInfo: GameEnginePlayInformation
    
    private var explosionSound = AudioManager(for: "explosionSound", with: "mp3")
    
    private var isMatch = true
    
    init(gameEngineBoardManager: GameEngineBoard,
         gameEngineBoardHandler: GameEngineBoardChangeHandler,
         gamePlayInfo: GameEnginePlayInformation) {
        self.gameBoardManager = gameEngineBoardManager
        self.gameBoardHandler = gameEngineBoardHandler
        self.gamePlayInfo = gamePlayInfo
    }
    
    //MARK: - Define check matches funcitons
    
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
                    
                    self.explosionSound.audioPlayer?.play()
                    
                    if gameBoardManager.gameBoard[index].id == gamePlayInfo.gameInstance.id  && gamePlayInfo.score != 0 {
                        gamePlayInfo.updatedStarEstimation = 5 * (150 / gamePlayInfo.score)
                        gamePlayInfo.score -= 5
                    }
                    
                    var currentIndex = index
                
                    gameBoardManager.gameBoard[index] = EmptyInstance()
                    gameBoardManager.gameBoard[index + 1] = EmptyInstance()
                    gameBoardManager.gameBoard[index + 2] = EmptyInstance()
                    gameBoardManager.gameBoard[index + 3] = EmptyInstance()
                    gameBoardManager.gameBoard[index + 4] = EmptyInstance()
                    
                    self.gameBoardHandler.reloadItems?([index, index + 1, index + 2, index + 3, index + 4])

                    gameBoardManager.gameBoard[index] = GameInstanceView.random()
                    gameBoardManager.gameBoard[index + 1] = GameInstanceView.random()
                    gameBoardManager.gameBoard[index + 2] = GameInstanceView.random()
                    gameBoardManager.gameBoard[index + 3] = GameInstanceView.random()
                    gameBoardManager.gameBoard[index + 4] = GameInstanceView.random()
                                        
                    while currentIndex >= numberOfItemsInRow {
                        gameBoardManager.gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow)
                        gameBoardManager.gameBoard.swapAt(currentIndex + 1, (currentIndex + 1) - numberOfItemsInRow)
                        gameBoardManager.gameBoard.swapAt(currentIndex + 2, (currentIndex + 2) - numberOfItemsInRow)
                        gameBoardManager.gameBoard.swapAt(currentIndex + 3, (currentIndex + 3) - numberOfItemsInRow)
                        gameBoardManager.gameBoard.swapAt(currentIndex + 4, (currentIndex + 4) - numberOfItemsInRow)
                        
                        gameBoardHandler.fallDownAtRow?([currentIndex, currentIndex + 1, currentIndex + 2, currentIndex + 3, currentIndex + 4])
                        currentIndex -= numberOfItemsInRow
                    }
                
                    gameBoardHandler.reloadItems?([currentIndex, currentIndex + 1, currentIndex + 2, currentIndex + 3, currentIndex + 4])
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
                    
                    self.explosionSound.audioPlayer?.play()
                    
                    if gameBoardManager.gameBoard[index].id == gamePlayInfo.gameInstance.id  && gamePlayInfo.score != 0 {
                        gamePlayInfo.updatedStarEstimation = 5 * (150 / gamePlayInfo.score)
                        gamePlayInfo.score -= 5
                    }

                    var currentIndex = index + numberOfItemsInRow * 4
                    
                    gameBoardManager.gameBoard[index] = EmptyInstance()
                    gameBoardManager.gameBoard[index + numberOfItemsInRow] = EmptyInstance()
                    gameBoardManager.gameBoard[index + numberOfItemsInRow * 2] = EmptyInstance()
                    gameBoardManager.gameBoard[index + numberOfItemsInRow * 3] = EmptyInstance()
                    gameBoardManager.gameBoard[index + numberOfItemsInRow * 4] = EmptyInstance()
                    
                    gameBoardHandler.reloadItems?([index, index + numberOfItemsInRow, index + numberOfItemsInRow * 2,
                                                 index + numberOfItemsInRow * 3, index + numberOfItemsInRow * 4])
                    
                    gameBoardManager.gameBoard[index] = GameInstanceView.random()
                    gameBoardManager.gameBoard[index + numberOfItemsInRow] = GameInstanceView.random()
                    gameBoardManager.gameBoard[index + numberOfItemsInRow * 2] = GameInstanceView.random()
                    gameBoardManager.gameBoard[index + numberOfItemsInRow * 3] = GameInstanceView.random()
                    gameBoardManager.gameBoard[index + numberOfItemsInRow * 4] = GameInstanceView.random()
                    
                    while currentIndex >= numberOfItemsInRow * 5 {
                        gameBoardManager.gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow * 4)
                        
                        gameBoardHandler.fallDownAtColumn?(currentIndex, 5)
                        currentIndex -= numberOfItemsInRow
                    }
                    
                    gameBoardHandler.reloadItems?([currentIndex, currentIndex - numberOfItemsInRow, currentIndex - numberOfItemsInRow * 2,
                                                   currentIndex - numberOfItemsInRow * 3, currentIndex - numberOfItemsInRow * 4])
                    
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
                    
                    self.explosionSound.audioPlayer?.play()
                    
                    if gameBoardManager.gameBoard[index].id == gamePlayInfo.gameInstance.id  && gamePlayInfo.score != 0 {
                        gamePlayInfo.updatedStarEstimation = 4 * (150 / gamePlayInfo.score)
                        gamePlayInfo.score -= 4
                    }
                    
                    var currentIndex = index
             
                    gameBoardManager.gameBoard[index] = EmptyInstance()
                    gameBoardManager.gameBoard[index + 1] = EmptyInstance()
                    gameBoardManager.gameBoard[index + 2] = EmptyInstance()
                    gameBoardManager.gameBoard[index + 3] = EmptyInstance()
                    
                    gameBoardHandler.reloadItems?([index, index + 1, index + 2, index + 3])

                    gameBoardManager.gameBoard[index] = GameInstanceView.random()
                    gameBoardManager.gameBoard[index + 1] = GameInstanceView.random()
                    gameBoardManager.gameBoard[index + 2] = GameInstanceView.random()
                    gameBoardManager.gameBoard[index + 3] = GameInstanceView.random()
                    
                    while currentIndex >= numberOfItemsInRow {
                        gameBoardManager.gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow)
                        gameBoardManager.gameBoard.swapAt(currentIndex + 1, (currentIndex + 1) - numberOfItemsInRow)
                        gameBoardManager.gameBoard.swapAt(currentIndex + 2, (currentIndex + 2) - numberOfItemsInRow)
                        gameBoardManager.gameBoard.swapAt(currentIndex + 3, (currentIndex + 3) - numberOfItemsInRow)
                    
                        gameBoardHandler.fallDownAtRow?([currentIndex, currentIndex + 1, currentIndex + 2, currentIndex + 3])
                        currentIndex -= numberOfItemsInRow
                    }
                    
                    gameBoardHandler.reloadItems?([currentIndex, currentIndex + 1, currentIndex + 2, currentIndex + 3])
                    
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

                    self.explosionSound.audioPlayer?.play()
                    
                    if gameBoardManager.gameBoard[index].id == gamePlayInfo.gameInstance.id  && gamePlayInfo.score != 0 {
                        gamePlayInfo.updatedStarEstimation = 4 * (150 / gamePlayInfo.score)
                        gamePlayInfo.score -= 4
                    }

                    var currentIndex = index + numberOfItemsInRow * 3
                    
                    gameBoardManager.gameBoard[index] = EmptyInstance()
                    gameBoardManager.gameBoard[index + numberOfItemsInRow] = EmptyInstance()
                    gameBoardManager.gameBoard[index + numberOfItemsInRow * 2] = EmptyInstance()
                    gameBoardManager.gameBoard[index + numberOfItemsInRow * 3] = EmptyInstance()
                    
                    gameBoardHandler.reloadItems?([index, index + numberOfItemsInRow, index + numberOfItemsInRow * 2, index + numberOfItemsInRow * 3])
                    
                    gameBoardManager.gameBoard[index] = GameInstanceView.random()
                    gameBoardManager.gameBoard[index + numberOfItemsInRow] = GameInstanceView.random()
                    gameBoardManager.gameBoard[index + numberOfItemsInRow * 2] = GameInstanceView.random()
                    gameBoardManager.gameBoard[index + numberOfItemsInRow * 3] = GameInstanceView.random()

                    while currentIndex >= numberOfItemsInRow * 4 {
                        gameBoardManager.gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow * 4)
                        
                        gameBoardHandler.fallDownAtColumn?(currentIndex, 4)
                        currentIndex -= numberOfItemsInRow
                    }
                    
                    gameBoardHandler.reloadItems?([currentIndex, currentIndex - numberOfItemsInRow,
                                                   currentIndex - numberOfItemsInRow * 2, currentIndex - numberOfItemsInRow * 3])
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
                    
                    self.explosionSound.audioPlayer?.play()
                    
                    if gameBoardManager.gameBoard[index].id == gamePlayInfo.gameInstance.id {
                        gamePlayInfo.updatedStarEstimation = 3 * (150 / gamePlayInfo.score)
                        gamePlayInfo.score -= 3
                    }
                    
                    var currentIndex = index
                    
                    gameBoardManager.gameBoard[index] = EmptyInstance()
                    gameBoardManager.gameBoard[index + 1] = EmptyInstance()
                    gameBoardManager.gameBoard[index + 2] = EmptyInstance()
                    
                    gameBoardHandler.reloadItems?([index, index + 1, index + 2])
                    
                    while currentIndex >= numberOfItemsInRow {
                        gameBoardManager.gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow)
                        gameBoardManager.gameBoard.swapAt(currentIndex + 1, (currentIndex + 1) - numberOfItemsInRow)
                        gameBoardManager.gameBoard.swapAt(currentIndex + 2, (currentIndex + 2) - numberOfItemsInRow)
                        
                        let indexes = [currentIndex, currentIndex + 1, currentIndex + 2]
                        
                        gameBoardHandler.fallDownAtRow?(indexes)
                        currentIndex -= numberOfItemsInRow
                    }
                    
                    gameBoardManager.gameBoard[currentIndex] = GameInstanceView.random()
                    gameBoardManager.gameBoard[currentIndex + 1] = GameInstanceView.random()
                    gameBoardManager.gameBoard[currentIndex + 2] = GameInstanceView.random()
                    
                    gameBoardHandler.reloadItems?([currentIndex, currentIndex + 1, currentIndex + 2])

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
                    gameBoardManager.gameBoard[index].id == gameBoardManager.gameBoard[index + numberOfItemsInRow * 2].id &&
                    gameBoardManager.gameBoard[index].id != 0
                {

                    self.explosionSound.audioPlayer?.play()
                    
                    if gameBoardManager.gameBoard[index].id == gamePlayInfo.gameInstance.id  && gamePlayInfo.score != 0 {
                        gamePlayInfo.updatedStarEstimation = 3 * (150 / gamePlayInfo.score)
                        gamePlayInfo.score -= 3
                    }

                    var currentIndex = index + numberOfItemsInRow * 2
                    
                   
                    
                    gameBoardManager.gameBoard[index] = EmptyInstance()
                    gameBoardManager.gameBoard[index + numberOfItemsInRow] = EmptyInstance()
                    gameBoardManager.gameBoard[index + numberOfItemsInRow * 2] = EmptyInstance()
                    
                    gameBoardHandler.reloadItems?([index, index + numberOfItemsInRow, index + numberOfItemsInRow * 2])
                    
                    gameBoardManager.gameBoard[index] = GameInstanceView.random()
                    gameBoardManager.gameBoard[index + numberOfItemsInRow] = GameInstanceView.random()
                    gameBoardManager.gameBoard[index + numberOfItemsInRow * 2] = GameInstanceView.random()
                    
                    while currentIndex >= numberOfItemsInRow * 3 {
                        gameBoardManager.gameBoard.swapAt(currentIndex, currentIndex - numberOfItemsInRow * 3)
                        
                        gameBoardHandler.fallDownAtColumn?(currentIndex, 3)
                        currentIndex -= numberOfItemsInRow
                    }
                    
                    gameBoardHandler.reloadItems?([currentIndex, currentIndex - numberOfItemsInRow, currentIndex - numberOfItemsInRow * 2])
                    return true
                }
            }
        }
//        
        return false
    }
    
    //MARK: -  Check for matches on the game board and handle them.
    func checkMatches() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isMatch = true
            
            if self.isMatch == false {
                return
            }
            
            if self.checkFiveMatchAtRow() {
                self.gamePlayInfo.combo += 1
                self.explosionSound.audioPlayer?.play()
                self.isMatch = true
                self.checkMatches()
            } else if self.checkFiveMatchAtColumn() {
                self.gamePlayInfo.combo += 1
                self.explosionSound.audioPlayer?.play()
                self.isMatch = true
                self.checkMatches()
            } else if self.checkFourMatchAtRow() {
                self.gamePlayInfo.combo += 1
                self.explosionSound.audioPlayer?.play()
                self.isMatch = true
                self.checkMatches()
            } else if self.checkFourMatchAtColumn() {
                self.gamePlayInfo.combo += 1
                self.explosionSound.audioPlayer?.play()
                self.isMatch = true
                self.checkMatches()
            } else if self.checkThreeMatchAtRow() {
                self.gamePlayInfo.combo += 1
                self.explosionSound.audioPlayer?.play()
                self.isMatch = true
                self.checkMatches()
            } else if self.checkThreeMatchAtColumn() {
                self.gamePlayInfo.combo += 1
                self.explosionSound.audioPlayer?.play()
                self.isMatch = true
                self.checkMatches()
            } else {
                self.gamePlayInfo.isUserInteractionEnabled = true
                self.isMatch = false
                self.gamePlayInfo.combo = 0
            }
        }
    }
    
    //MARK: - Check for matches resulting from a swipe gesture.
    func checkMatchForSwipeGesture() -> Bool {
        gamePlayInfo.isUserInteractionEnabled = false
        
        if checkFiveMatchAtRow() {
            gamePlayInfo.combo = 1
            return true
        } else if checkFiveMatchAtColumn() {
            gamePlayInfo.combo = 1
            return true
        } else if checkFourMatchAtRow() {
            gamePlayInfo.combo = 1
            return true
        } else if checkFourMatchAtColumn() {
            gamePlayInfo.combo = 1
            return true
        } else if checkThreeMatchAtRow() {
            gamePlayInfo.combo = 1
            return true
        } else if checkThreeMatchAtColumn() {
            gamePlayInfo.combo = 1
            return true
        }
        
        gamePlayInfo.isUserInteractionEnabled = true
        gamePlayInfo.combo = 0
        return false
    }
}
