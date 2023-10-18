//
//  SettingsGameViewController.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Er Baghdasaryan on 12.10.23.
//
import UIKit

final class PauseGameViewController: UIViewController {
    
    private let pauseGameView = PauseGameView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}


//MARK: Setup Constraints and gradient
extension PauseGameViewController {
    private func setupUI() {
        pauseGameView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pauseGameView)
        
        NSLayoutConstraint.activate([
            pauseGameView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pauseGameView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pauseGameView.widthAnchor.constraint(equalToConstant: 250),
            pauseGameView.heightAnchor.constraint(equalToConstant: 350)
        ])
        
        pauseGameView.setupUI()
        pauseGameView.setupGradient()
        
        pauseGameView.layer.cornerRadius = 40
        pauseGameView.layer.masksToBounds = true
        
        pauseGameView.resumeButton.addTarget(self, action: #selector(resumeButtonTapped), for: .touchUpInside)
        pauseGameView.startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        pauseGameView.exitButton.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        pauseGameView.backgroundGradientLayer.frame = CGRect(x: 0, y: 0,
                                          width: pauseGameView.bounds.size.width,
                                          height: pauseGameView.bounds.size.height)
        pauseGameView.resumeButtonGradientLayer.frame = CGRect(x: 0, y: 0,
                                                               width: pauseGameView.resumeButton.bounds.size.width,
                                                               height: pauseGameView.resumeButton.bounds.size.height)
        
        pauseGameView.startButtonGradientLayer.frame = CGRect(x: 0, y: 0,
                                                               width: pauseGameView.startButton.bounds.size.width,
                                                               height: pauseGameView.startButton.bounds.size.height)
        
        pauseGameView.exitButtonGradientLayer.frame = CGRect(x: 0, y: 0,
                                                               width: pauseGameView.exitButton.bounds.size.width,
                                                               height: pauseGameView.exitButton.bounds.size.height)
        
    }
    
    @objc func resumeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func startButtonTapped() {
        let gameView = GameViewController()
        gameView.modalPresentationStyle = .fullScreen
        gameView.viewModal = GameViewModel()
        present(gameView, animated: true)
    }
    
    @objc func exitButtonTapped() {
        let alertController = UIAlertController(title: "Exit Game",
                                                message: "Are you sure you want to exit the game?",
                                                preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alertController.addAction(cancelAction)
        
        let exitAction = UIAlertAction(title: "Exit", style: .default) { (_) in
            exit(0)
        }
        alertController.addAction(exitAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
