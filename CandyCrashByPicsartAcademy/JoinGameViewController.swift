//
//  ViewController.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 12.09.23.
//

import UIKit

final class JoinGameViewController: UIViewController {
    
    private let joinView = JoinGameView()
    var gamePlayInformation: GameEnginePlayInformation?
    private var joinGameBackgroundMusic = AudioManager(for: "joinSound", with: ".mp3")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        joinGameBackgroundMusic.audioPlayer?.play()
    }
}

//MARK: Setup Constraints and Gradient
extension JoinGameViewController {
    private func setupUI() {
        joinView.frame = view.frame
        
        view.addSubview(joinView)
        
        joinView.setupUI()
        joinView.setupGradient()
        
        joinView.playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        joinView.playBeforeButton.addTarget(self, action: #selector(playBeforeTapped), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        joinView.firstGradientLayer.frame = CGRect(x: 0, y: 0,
                                          width: joinView.playButton.bounds.size.width,
                                          height: joinView.playButton.bounds.size.height)
        
        joinView.secondGradientLayer.frame = CGRect(x: 0, y: 0,
                                           width: joinView.playBeforeButton.bounds.size.width,
                                           height: joinView.playBeforeButton.bounds.size.height)
    }
    
    @objc func playButtonTapped() {
        let gameVC = GameViewController()
        gameVC.modalPresentationStyle = .fullScreen
        self.gamePlayInformation = gameVC.viewModal.gameEnginePlayInfoManager
        self.dismiss(animated: false)
        present(gameVC, animated: true) {
            self.joinGameBackgroundMusic.audioPlayer?.stop()
            self.joinGameBackgroundMusic.audioPlayer = nil
        }
    }
    
    public func playBeforeInfo() -> GameDataToSave {
        let gameView = GameViewController()
        let playBeforeInfo = gameView.viewModal.gameEnginePlayInfoManager.loadFromUserDefaults()
        return GameDataToSave(score: playBeforeInfo!.score, countOfSteps: playBeforeInfo!.countOfSteps, updateStarEstimate: playBeforeInfo!.updateStarEstimate, id: playBeforeInfo!.id)
    }

    @objc func playBeforeTapped() {
        let gameVC = GameViewController()
        
        if let playBeforeInfo = gameVC.viewModal.gameEnginePlayInfoManager.loadFromUserDefaults() {
            var gameInstance: GameInstance?
           
            switch playBeforeInfo.id {
            case 1:
                gameInstance = HeartInstance()
            case 2:
                gameInstance = StarInstance()
            case 3:
                gameInstance = TriangleInstance()
            case 4:
                gameInstance = SquareInstance()
            default:
                gameInstance = EmptyInstance()
            }
            
            let gamePlayInfo = GameEnginePlayInformationManager(score: playBeforeInfo.score, countOfSteps: playBeforeInfo.countOfSteps, updatedStarEstimation: playBeforeInfo.updateStarEstimate)
            
            gamePlayInfo.gameInstance = gameInstance!
            gameVC.modalPresentationStyle = .fullScreen
            
            gameVC.viewModal.changeGamePlayManager(gamePlayManager: gamePlayInfo)
            gameVC.gameView.updateLabelsWithGamePlayInfo(gamePlayInformation: gamePlayInfo)
            
            self.dismiss(animated: true)
            
            present(gameVC, animated: true) {
                gameVC.gameView.updateLabelsWithGamePlayInfo(gamePlayInformation: gamePlayInfo)
                self.joinGameBackgroundMusic.audioPlayer?.stop()
                self.joinGameBackgroundMusic.audioPlayer = nil
            }
        }
    }
}
