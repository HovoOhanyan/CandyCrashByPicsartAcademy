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
        gameView.pausedButton.addTarget(self, action: #selector(pausedButtonTapped), for: .touchUpInside)

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
                resumeVC.modalPresentationStyle = .overCurrentContext
                self.present(resumeVC, animated: true)
            
            } else if score > 0 && countOfSteps == 0 {
                let  restartVC = RestartGameViewController()
                restartVC.modalPresentationStyle = .overCurrentContext
                self.present(restartVC, animated: true)
            }
        }
        
        viewModal.updateStarLayer = { starChanges in
            self.gameView.updateStarLayerFrame(updatedStarEstimation: starChanges)
        }
    }
    
    private func setupSwipeGesture() {
        let customSwipeGestureRecognizer = CustomSwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture))
        gameView.gameAreaView.addGestureRecognizer(customSwipeGestureRecognizer)
    }
    
    @objc private func pausedButtonTapped() {

        let pauseView = PauseGameViewController()
        pauseView.modalPresentationStyle = .custom
        pauseView.preferredContentSize = CGSize(width: 400, height: 400)

        present(pauseView, animated: true)
    }
}
