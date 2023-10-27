//
//  ResumeGameViewController.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Er Baghdasaryan on 10.10.23.
//

import UIKit

final class ResumeGameViewController: UIViewController {
    
    private let resumeGameView = ResumeGameView()
    private var resumeGameMusic = AudioManager(for: "winOrLose", with: "mp3")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        resumeGameMusic.audioPlayer?.play()
    }
}


//MARK: Setup Constraints and gradient
extension ResumeGameViewController {
    private func setupUI() {
        resumeGameView.frame = view.frame
        
        view.addSubview(resumeGameView)
        
        resumeGameView.setupUI()
        resumeGameView.setupGradient()
        
        resumeGameView.resumeButton.addTarget(self, action: #selector(resumeButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        resumeGameView.gradientLayer.frame = CGRect(x: 0, y: 0,
                                          width: resumeGameView.resumeButton.bounds.size.width,
                                          height: resumeGameView.resumeButton.bounds.size.height)
    }
    
    @objc func resumeButtonTapped() {
        let gameView = GameViewController()
        gameView.modalPresentationStyle = .fullScreen
        present(gameView, animated: true) {
            gameView.backgroundMusic.audioPlayer?.play()
            self.resumeGameMusic.audioPlayer?.stop()
            self.resumeGameMusic.audioPlayer = nil
        }
    }
}

