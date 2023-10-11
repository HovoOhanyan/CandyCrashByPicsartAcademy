//
//  GameViewController.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 25.09.23.
//

import UIKit

final class GameViewController: UIViewController {
    public var viewModal: GameViewModel!
    
    let gameView = GameView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSwipeGesture()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        gameView.createGameBoard(gameBoard: viewModal.gameEngine.gameBoardManager)
        setupSwipeGesture()
    }
    
    private func setupUI() {
        gameViewModalSetup()
        gameView.frame = view.frame
        gameView.bounds = view.bounds
        
        gameView.setupUI(gamePlayInformation: viewModal.gameEngine.gamePlayManager)
        gameView.setupGradient()
        gameView.setupShapeLayer()

        view.addSubview(gameView)
    }
    
    private func gameViewModalSetup() {
        viewModal = GameViewModel()
        
        viewModal?.reloadItem = { indexes in
            UIView.animate(withDuration: 0.9) {
                for index in indexes {
                    self.gameView.gameInstanceArray[index].configuration(gameInstance: self.viewModal.gameEngine.gameBoardManager.gameBoard[index],
                                                                 index: self.gameView.gameInstanceArray[index].gameInstance.index)
                    
                }
            }
        }
        
        viewModal?.fallDownAtRow = { indexes in
            UIView.animate(withDuration: 0.9) {
                for index in indexes {
                    let numberOfItemsInRow = self.viewModal.gameEngine.gameBoardManager.numberOfItemsInRow
                    let firstItem = self.gameView.gameInstanceArray[index]
                    let secondItem = self.gameView.gameInstanceArray[index - numberOfItemsInRow]
                
                    self.gameView.gameInstanceArray.swapAt(index, index - numberOfItemsInRow)
                    
                    let firstItemFrame = firstItem.frame
                    firstItem.frame = secondItem.frame
                    secondItem.frame = firstItemFrame
                                        
                    let tempIndex = firstItem.gameInstance.index
                    firstItem.gameInstance.index = secondItem.gameInstance.index
                    secondItem.gameInstance.index = tempIndex
                }
            }
        }
        
        viewModal?.fallDownAtColumn = { index, check in
            UIView.animate(withDuration: 0.8) {
                let numberOfItemsInRow = self.viewModal.gameEngine.gameBoardManager.numberOfItemsInRow
                let firstItem = self.gameView.gameInstanceArray[index]
                let secondItem = self.gameView.gameInstanceArray[index - numberOfItemsInRow * check]
                
                self.gameView.gameInstanceArray.swapAt(index, index - numberOfItemsInRow * check)
                
                let firstItemFrame = firstItem.frame
                firstItem.frame = secondItem.frame
                secondItem.frame = firstItemFrame
                
                let tempIndex = firstItem.gameInstance.index
                firstItem.gameInstance.index = secondItem.gameInstance.index
                secondItem.gameInstance.index = tempIndex
            }
        }
        
        viewModal?.updateLabel = { score, countOfSteps in
            if score > 0 && countOfSteps > 0 {
                self.gameView.updateScoreLabel(score: score)
                self.gameView.updateCountOfStepsLabel(countOfSteps: countOfSteps)
            } else if score <= 0 && countOfSteps >= 0 {
                let  resumeVC = ResumeGameViewController()
                resumeVC.modalPresentationStyle = .fullScreen
                self.present(resumeVC, animated: true)
            
            } else if score > 0 && countOfSteps == 0 {
                let  restartVC = RestartGameViewController()
                restartVC.modalPresentationStyle = .fullScreen
                self.present(restartVC, animated: true)
            }
        }
        
        viewModal.updateStarLayer = { starChanges in
            self.gameView.updateStarLayerFrame(updatedStarEstimation: starChanges)
        }
    }
    
    private func setupSwipeGesture() {
        gameView.gameInstanceArray.forEach { view in
            view.isUserInteractionEnabled = true
            let customSwipeGestureRecognizer = CustomSwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture))
            view.addGestureRecognizer(customSwipeGestureRecognizer)
        }
    }
}
