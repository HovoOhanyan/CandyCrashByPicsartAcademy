//
//  GameViewController.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 25.09.23.
//

import UIKit

final class GameViewController: UIViewController {
    
    private let gameView = GameView()
    public var collectionView: UICollectionView!
    
    private(set) var viewModal = GameViewModal(numberOfItemsInRow: 5, boardSize: 40)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        collectionViewSetup()
        
        collectionView.backgroundColor = .gradientFirst1()
        gameView.translatesAutoresizingMaskIntoConstraints = false
        gameView.setupUI()
        gameView.setupGradient()
        
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
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(GameInstanceCell.self, forCellWithReuseIdentifier: GameInstanceCell.identifier)
    }
}
