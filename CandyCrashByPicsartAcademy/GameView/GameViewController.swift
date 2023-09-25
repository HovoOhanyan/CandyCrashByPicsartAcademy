//
//  GameViewController.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 25.09.23.
//

import UIKit

final class GameViewController: UIViewController {
    private let gameView = GameView()
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        collectionViewSetup()
        
        view.addSubview(collectionView)
        gameView.setupUI()
        
        collectionView.frame = view.frame
    }
    
    private func collectionViewSetup() {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(GameInstanceCell.self, forCellWithReuseIdentifier: GameInstanceCell.identifier)
    }
}
