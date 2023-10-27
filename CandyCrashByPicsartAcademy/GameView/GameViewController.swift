//
//  GameViewController.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 25.09.23.
//

import UIKit

final class GameViewController: UIViewController {
    
    public var viewModal: GameViewModel = GameViewModel()
    let gameView = GameView()
    public let backgroundMusic = AudioManager(for: "backgroundMusic", with: "mp3")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSwipeGesture()
        backgroundMusic.audioPlayer?.play()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        gameView.createGameBoard(gameBoard: viewModal.gameEngine.gameBoardManager)
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
    
    private func setupSwipeGesture() {
        let customSwipeGestureRecognizer = CustomSwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture))
        gameView.gameAreaView.addGestureRecognizer(customSwipeGestureRecognizer)
    }
    
    @objc private func pausedButtonTapped() {
        let pauseView = PauseGameViewController()
        pauseView.gamePlayInformation = self.viewModal.gameEngine.gamePlayManager
        pauseView.modalPresentationStyle = .custom
        pauseView.preferredContentSize = CGSize(width: 400, height: 400)
        present(pauseView, animated: true) {
            self.backgroundMusic.audioPlayer?.pause()
        }
    }
}
