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
            if let view = gestureRecognizer.view as? GameInstanceView {
                switch gestureRecognizer.swipeDirection {
                case .left:
                    
                    let index = view.gameInstance.index
                    let first = self.gameView.gameInstanceArray[index]
                    let second = self.gameView.gameInstanceArray[index - 1]
                   
                    if view.gameInstance.index - 1 >= 0 {
                        UIView.animate(withDuration: 0.6) {
                            self.gameView.gameInstanceArray.swapAt(index, index - 1)
                            
                            let tempFrame = first.frame
                            first.frame = second.frame
                            second.frame = tempFrame
                        }
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
                case .right:
                    
                    let index = view.gameInstance.index
                    let first = self.gameView.gameInstanceArray[index]
                    let second = self.gameView.gameInstanceArray[index + 1]
                    
                    if index > 0 {
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
                                
                                self.gameView.viewArray.swapAt(index, index + 1)
                                
                                tempIndex = first.gameInstance.index
                                first.gameInstance.index = second.gameInstance.index
                                second.gameInstance.index = tempIndex
                            }
                        }
                    }
                case .up:
                        let index = view.gameInstance.index
                        let numberOfItemsInRow = self.viewModal.gameEngine.gameBoardManager.numberOfItemsInRow
                        let first = self.gameView.gameInstanceArray[index]
                        let second = self.gameView.gameInstanceArray[index - numberOfItemsInRow]
                        
                    if index > 0 {
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
                                self.gameView.viewArray.swapAt(index, index - numberOfItemsInRow)

                                let tempIndex = first.gameInstance.index
                                first.gameInstance.index = second.gameInstance.index
                                second.gameInstance.index = tempIndex
                            }
                        }
                    }
                case .down:
                        let index = view.gameInstance.index
                        let numberOfItemsInRow = self.viewModal.gameEngine.gameBoardManager.numberOfItemsInRow
                        
                        let first = self.gameView.gameInstanceArray[index]
                        let second = self.gameView.gameInstanceArray[index + numberOfItemsInRow]
                        
                    if index > 0 {
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
                                
                                self.gameView.viewArray.swapAt(index, index + numberOfItemsInRow)

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
    }
}

