//
//  ViewController.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 12.09.23.
//

import UIKit

final class JoinGameViewController: UIViewController {
    private let joinView = JoinGameView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
}

//MARK: Setup Constraints and Gradient
extension JoinGameViewController {
    private func setupUI() {
        joinView.frame = view.frame
        
        view.addSubview(joinView)
        
        joinView.setupUI()
        joinView.setupGradient()
    }
    
    override func viewDidLayoutSubviews() {
        joinView.firstGradientLayer.frame = CGRect(x: 0, y: 0,
                                          width: joinView.playButton.bounds.size.width,
                                          height: joinView.playButton.bounds.size.height)
        
        joinView.secondGradientLayer.frame = CGRect(x: 0, y: 0,
                                           width: joinView.playBeforeButton.bounds.size.width,
                                           height: joinView.playBeforeButton.bounds.size.height)
    }
    
    @objc func PlayButtonTapped() {
        let gameView = GameViewController()
        gameView.modalPresentationStyle = .fullScreen
        present(gameView, animated: true)
    }
}
