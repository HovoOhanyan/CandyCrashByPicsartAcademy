//
//  GameViewController.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 25.09.23.
//

import UIKit

final class GameViewController: UIViewController {
    public var viewModal: GameViewModel!
    
    private let gameView = GameView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        gameViewModalSetup()
        
        gameView.translatesAutoresizingMaskIntoConstraints = false
        gameView.setupUI(gamePlayInformation: viewModal.gameEngine.gamePlayManager)
        gameView.setupGradient()
        gameView.setupShapeLayer()

        view.addSubview(gameView)
        
        NSLayoutConstraint.activate([
            gameView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            gameView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            gameView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            gameView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    
    private func gameViewModalSetup() {
        viewModal = GameViewModel()
        
        viewModal?.reloadItem = { indexPath in
           
        }
        
        viewModal?.updateCountOfStepsLabel = { countsOfSteps in
            self.gameView.updateCountOfStepsLabel(countOfSteps: countsOfSteps)
        }
        
        viewModal?.updateLabel = { score, countOfSteps in
            print(score)
            if score > 0 && countOfSteps > 0 {
                self.gameView.updateScoreLabel(score: score)
                self.gameView.updateCountOfStepsLabel(countOfSteps: countOfSteps)
            } else if score < 0 && countOfSteps > 0{
                let  resumeVC = ResumeGameViewController()
                resumeVC.modalPresentationStyle = .fullScreen
                self.present(resumeVC, animated: true)
            
            } else if score > 0 && countOfSteps < 0 {
                let  restartVC = RestartGameViewController()
                restartVC.modalPresentationStyle = .fullScreen
                self.present(restartVC, animated: true)
            }
        }
        
        viewModal.updateStarLayer = { starChanges in
            self.gameView.updateStarLayerFrame(updatedStarEstimation: starChanges)
        }
    }
}
