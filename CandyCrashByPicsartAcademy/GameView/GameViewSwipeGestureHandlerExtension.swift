//
//  GameViewSwipeGestureDelegateExtension.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 26.09.23.
//

import UIKit

extension GameViewController {
    @objc func handleSwipeGesture(_ gestureRecognizer: CustomSwipeGestureRecognizer) {
        if gestureRecognizer.state == .recognized {
            let location = gestureRecognizer.initialTouchLocation
            
            let indexAtArray = calculateIndexOfGameInstanceView(location: location)
            let index = gameView.gameInstanceArray[indexAtArray].gameInstance.index
            
            switch gestureRecognizer.swipeDirection {
            case .left:
                let numberOfItemsInRow = viewModal.gameEngine.gameBoardManager.numberOfItemsInRow
                
                if index % numberOfItemsInRow != 0 {
                    let first = self.gameView.gameInstanceArray[index]
                    let second = self.gameView.gameInstanceArray[index - 1]
                    
                    UIView.animate(withDuration: 0.6) {
                        self.gameView.gameInstanceArray.swapAt(index, index - 1)
                        
                        let tempFrame = first.frame
                        first.frame = second.frame
                        second.frame = tempFrame
                    }
                    
                    
                    var tempIndex = first.gameInstance.index
                    first.gameInstance.index = second.gameInstance.index
                    second.gameInstance.index = tempIndex
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        if self.viewModal.gameEngine.gameSwipeManager.swipeLeftGesture(index: index) {
                            self.viewModal.gameEngine.gameCheckMatchsManager.checkMatches()
                        } else {
                            self.gameView.gameInstanceArray.swapAt(index, index - 1)
                            
                            tempIndex = first.gameInstance.index
                            first.gameInstance.index = second.gameInstance.index
                            second.gameInstance.index = tempIndex
                            
                            UIView.animate(withDuration: 0.5) {
                                let tempFrame = first.frame
                                first.frame = second.frame
                                second.frame = tempFrame
                            }
                        }
                    }
                }
            case .right:
                let numberOfItemsInRow = viewModal.gameEngine.gameBoardManager.numberOfItemsInRow

                if index % numberOfItemsInRow != 4 {
                    let first = self.gameView.gameInstanceArray[index]
                    let second = self.gameView.gameInstanceArray[index + 1]
                    
                    self.gameView.gameInstanceArray.swapAt(index, index + 1)
                    
                    UIView.animate(withDuration: 0.9) {
                        let tempFrame = first.frame
                        first.frame = second.frame
                        second.frame = tempFrame
                    }
                    var tempIndex = first.gameInstance.index
                    first.gameInstance.index = second.gameInstance.index
                    second.gameInstance.index = tempIndex
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        if self.viewModal.gameEngine.gameSwipeManager.swipeRightGesture(index: index) {
                            self.viewModal.gameEngine.gameCheckMatchsManager.checkMatches()
                        } else {
                            UIView.animate(withDuration: 0.5) {
                                let tempFrame = first.frame
                                first.frame = second.frame
                                second.frame = tempFrame
                            }
                            
                            self.gameView.gameInstanceArray.swapAt(index, index + 1)
                            
                            tempIndex = first.gameInstance.index
                            first.gameInstance.index = second.gameInstance.index
                            second.gameInstance.index = tempIndex
                        }
                    }
                }
            case .up:
                    let numberOfItemsInRow = self.viewModal.gameEngine.gameBoardManager.numberOfItemsInRow
                    
                if index > numberOfItemsInRow - 1 {
                    let first = self.gameView.gameInstanceArray[index]
                    let second = self.gameView.gameInstanceArray[index - numberOfItemsInRow]
                    
                    self.gameView.gameInstanceArray.swapAt(index, index - numberOfItemsInRow)
                    
                    let tempIndex = first.gameInstance.index
                    first.gameInstance.index = second.gameInstance.index
                    second.gameInstance.index = tempIndex
                    
                    UIView.animate(withDuration: 0.9) {
                        let tempFrame = first.frame
                        first.frame = second.frame
                        second.frame = tempFrame
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        if self.viewModal.gameEngine.gameSwipeManager.swipeUpGesture(index: index) {
                            self.viewModal.gameEngine.gameCheckMatchsManager.checkMatches()
                        } else {
                            UIView.animate(withDuration: 0.5) {
                                let tempFrame = first.frame
                                first.frame = second.frame
                                second.frame = tempFrame
                            }
                            self.gameView.gameInstanceArray.swapAt(index, index - numberOfItemsInRow)

                            let tempIndex = first.gameInstance.index
                            first.gameInstance.index = second.gameInstance.index
                            second.gameInstance.index = tempIndex
                        }
                    }
                }
            case .down:
                let numberOfItemsInRow = self.viewModal.gameEngine.gameBoardManager.numberOfItemsInRow
                    
                if index < numberOfItemsInRow * ((gameView.gameInstanceArray.count / numberOfItemsInRow) - 1) {
                    
                    let first = self.gameView.gameInstanceArray[index]
                    let second = self.gameView.gameInstanceArray[index + numberOfItemsInRow]
                    
                
                    self.gameView.gameInstanceArray.swapAt(index, index + numberOfItemsInRow)
                    
                    UIView.animate(withDuration: 0.9) {
                        let tempFrame = first.frame
                        first.frame = second.frame
                        second.frame = tempFrame
                    }
                    
                    let tempIndex = first.gameInstance.index
                    first.gameInstance.index = second.gameInstance.index
                    second.gameInstance.index = tempIndex
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        if self.viewModal.gameEngine.gameSwipeManager.swipeDownGesture(index: index) {
                            self.viewModal.gameEngine.gameCheckMatchsManager.checkMatches()
                        } else {
                            UIView.animate(withDuration: 0.5) {
                                
                                let tempFrame = first.frame
                                first.frame = second.frame
                                second.frame = tempFrame
                            }
                            
                            self.gameView.gameInstanceArray.swapAt(index, index + numberOfItemsInRow)

                            let tempIndex = first.gameInstance.index
                            first.gameInstance.index = second.gameInstance.index
                            second.gameInstance.index = tempIndex
                        }
                    }
                }
            case .none:
                print("none")
            }
        }
    }
    
    private func calculateIndexOfGameInstanceView(location: CGPoint) -> Int {        
        let numberOfItemsInRow = self.viewModal.gameEngine.gameBoardManager.numberOfItemsInRow
        let numberOfItemsInColumn = self.viewModal.gameEngine.gameBoardManager.gameBoard.count / self.viewModal.gameEngine.gameBoardManager.numberOfItemsInRow
        
        let columnSpacing = CGFloat(2 * (numberOfItemsInRow - 1))
        let rowSpacing = CGFloat(2 * (numberOfItemsInColumn - 1))
        
        let instanceWidth = (self.gameView.gameAreaView.frame.width - columnSpacing) / CGFloat(numberOfItemsInRow)
        let instanceHeight = (self.gameView.gameAreaView.frame.height - rowSpacing) / CGFloat(numberOfItemsInColumn)
        
        let row = Int(location.y / instanceHeight)
        let column = Int(location.x / instanceWidth)
        
        return column + (row * numberOfItemsInRow)
    }
}

