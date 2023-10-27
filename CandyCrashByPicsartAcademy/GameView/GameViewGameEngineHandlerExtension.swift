//
//  GameViewGameEnigneHandlerExtension.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 19.10.23.
//

import UIKit

//MARK: - Sets up the handlers for the game view model, responsible for handling game logic.

extension GameViewController {
    public func gameViewModalSetup() {
        viewModal.gameEngine.gameEngineBoardHandler.reloadItems = { indexes in
            UIView.animate(withDuration: 0.9) {
                for index in indexes {
                    self.gameView.gameInstanceArray[index].configuration(gameInstance: self.viewModal.gameEngine.gameBoardManager.gameBoard[index],
                                                                         index: self.gameView.gameInstanceArray[index].gameInstance.index)
                    
                }
            }
        }
        
        
        /// This function handles the animation for items falling down in a row of a game board.
        /// - Parameter indexes: An array of indexes representing the items to be animated.
        ///
        viewModal.gameEngine.gameEngineBoardHandler.fallDownAtRow = { indexes in
            for index in indexes {
                let numberOfItemsInRow = self.viewModal.gameEngine.gameBoardManager.numberOfItemsInRow
                let firstItem = self.gameView.gameInstanceArray[index]
                let secondItem = self.gameView.gameInstanceArray[index - numberOfItemsInRow]
                
                // Hide the first item in the row.
                firstItem.alpha = 0
                
                // Animate the visual transition of items falling down.
                UIView.animate(withDuration: 0.9) {
                    self.gameView.gameInstanceArray.swapAt(index, index - numberOfItemsInRow)
                    
                    let firstItemFrame = firstItem.frame
                    firstItem.frame = secondItem.frame
                    secondItem.frame = firstItemFrame
                    
                    let tempIndex = firstItem.gameInstance.index
                    firstItem.gameInstance.index = secondItem.gameInstance.index
                    secondItem.gameInstance.index = tempIndex
                }
                
                let itemFrame = firstItem.frame
                
                // If the item is not in the top row, move it up and then back down with animation.
                if index >= numberOfItemsInRow && index < numberOfItemsInRow * 2 {
                    firstItem.frame = CGRect(x: itemFrame.minX, y: itemFrame.minY - itemFrame.height, width: itemFrame.width, height: itemFrame.height)
                    
                    // Delay the second animation to create a falling effect.
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        UIView.animate(withDuration: 0.7) {
                            firstItem.frame = itemFrame
                            firstItem.alpha = 1
                        }
                    }
                }
            }
        }
        
        /// This function handles the animation for items falling down in a column of a game board.
        
        ///   - index: The index of the item at the top of the column.
        ///   - check: The number of items to be moved down in the column.
        ///
        ///
        viewModal.gameEngine.gameEngineBoardHandler.fallDownAtColumn = { index, check in
            let numberOfItemsInRow = self.viewModal.gameEngine.gameBoardManager.numberOfItemsInRow
            let firstItem = self.gameView.gameInstanceArray[index]
            let secondItem = self.gameView.gameInstanceArray[index - numberOfItemsInRow * check]
            var count = 0
            
            // Hide the items as they fall down in the column.
            
            while count != check {
                self.gameView.gameInstanceArray[index - numberOfItemsInRow * count].alpha = 0
                count += 1
            }
            
            self.gameView.gameInstanceArray.swapAt(index, index - numberOfItemsInRow * check)
            
            // Animate the visual transition of items falling down.
            
            UIView.animate(withDuration: 0.8) {
                let firstItemFrame = firstItem.frame
                firstItem.frame = secondItem.frame
                secondItem.frame = firstItemFrame
                
                let tempIndex = firstItem.gameInstance.index
                firstItem.gameInstance.index = secondItem.gameInstance.index
                secondItem.gameInstance.index = tempIndex
            }
            
            // After a delay, restore the items and their positions.
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                if index < numberOfItemsInRow * (check + 1) {
                    count = 1
                    var arrayOfFrame: [CGRect] = []
                    
                    // Calculate the frames for the items moving up in the column.
                    while count <= check {
                        let frameOfInstance = self.gameView.gameInstanceArray[index - numberOfItemsInRow * count].frame
                        
                        self.gameView.gameInstanceArray[index - numberOfItemsInRow * count].frame = CGRect(x: frameOfInstance.minX,
                                                                                                           y: frameOfInstance.minY - frameOfInstance.height,
                                                                                                           width: frameOfInstance.width,
                                                                                                           height: frameOfInstance.height)
                        arrayOfFrame.append(frameOfInstance)
                        count += 1
                    }
                    
                    // Animate the items moving up in the column.
                    UIView.animate(withDuration: 0.7) {
                        count = 1
                        
                        while count <= check {
                            self.gameView.gameInstanceArray[index - numberOfItemsInRow * count].frame = arrayOfFrame[count - 1]
                            self.gameView.gameInstanceArray[index - numberOfItemsInRow * count].alpha = 1
                            count += 1
                        }
                    }
                }
            }
        }
        
        viewModal.gameEngine.gameEngineBoardHandler.updateLabelHandler = { score, countOfSteps in
            if score > 0 && countOfSteps > 0 {
                self.gameView.updateScoreLabel(score: score)
                self.gameView.updateCountOfStepsLabel(countOfSteps: countOfSteps)
            } else if score <= 0 && countOfSteps >= 0 {
                let  resumeVC = ResumeGameViewController()
                resumeVC.modalPresentationStyle = .overCurrentContext
                self.present(resumeVC, animated: true) {
                    self.backgroundMusic.audioPlayer?.stop()
                    self.backgroundMusic.audioPlayer = nil
                }
                
            } else if score > 0 && countOfSteps == 0 {
                let  restartVC = RestartGameViewController()
                restartVC.modalPresentationStyle = .overCurrentContext
                self.present(restartVC, animated: true) {
                    self.backgroundMusic.audioPlayer?.stop()
                    self.backgroundMusic.audioPlayer = nil
                }
            }
        }
        
        viewModal.gameEngine.gameEngineBoardHandler.updateStarChangesHandler = { starChanges in
            self.gameView.updateStarLayerFrame(updatedStarEstimation: starChanges)
        }
        
        viewModal.gameEngine.gameEngineBoardHandler.comboHandler = { combo in
            if combo > 1 {
                UIView.animate(withDuration: 0.9) {
                    self.gameView.updateComboLabel(combo: combo)
                    self.gameView.comboView.alpha = 1
                }
            } else {
                UIView.animate(withDuration: 0.9) {
                    self.gameView.comboView.alpha = 0
                }
            }
        }
        
        viewModal.gameEngine.gameEngineBoardHandler.isUserInteractionEnabledHandler = { isUserInteractionEnabled in
            self.gameView.pausedButton.isUserInteractionEnabled = isUserInteractionEnabled
            self.gameView.gameAreaView.isUserInteractionEnabled = isUserInteractionEnabled
        }
    }
}
