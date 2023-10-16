//
//  ResumeGameViewController.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Er Baghdasaryan on 03.10.23.
//

import UIKit

final class RestartGameViewController: UIViewController {
    
    private let restartGameView = RestartGameView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}


//MARK: Setup Constraints and gradient
extension RestartGameViewController {
    private func setupUI() {
        restartGameView.frame = view.frame
        
        view.addSubview(restartGameView)
        
        restartGameView.setupUI()
        restartGameView.setupGradient()
        
        restartGameView.restartButton.addTarget(self, action: #selector(restartButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        restartGameView.gradientLayer.frame = CGRect(x: 0, y: 0,
                                          width: restartGameView.restartButton.bounds.size.width,
                                          height: restartGameView.restartButton.bounds.size.height)
    }
    
    @objc func restartButtonTapped() {
        let gameView = GameViewController()
        gameView.modalPresentationStyle = .fullScreen
        gameView.viewModal = GameViewModel()
        present(gameView, animated: true)
    }
}
