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
    public var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        gameViewModalSetup()
        collectionViewSetup()
        
        gameView.translatesAutoresizingMaskIntoConstraints = false
        gameView.setupUI(gamePlayInformation: viewModal.gameEngine.gamePlayManager)
        gameView.setupGradient()
        gameView.setupShapeLayer()

        view.addSubview(gameView)
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gameView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            gameView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            gameView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            gameView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 195),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -170),
        ])
    }
    
    private func collectionViewSetup() {
        let layout = UICollectionViewFlowLayout()
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .gradientFirst1()
        collectionView.layer.cornerRadius = 10
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(GameInstanceCell.self, forCellWithReuseIdentifier: GameInstanceCell.identifier)
    }
    
    private func gameViewModalSetup() {
        viewModal = GameViewModel()
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        
        viewModal?.reloadItem = { indexPath in
            UIView.animate(withDuration: 0.7) {
                self.collectionView.reloadItems(at: indexPath)
            }
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
                let newModel = GameViewModel()
                
            }
        }
        
        viewModal.updateStarLayer = { starChanges in
            self.gameView.updateStarLayerFrame(updatedStarEstimation: starChanges)
        }
    }
}
