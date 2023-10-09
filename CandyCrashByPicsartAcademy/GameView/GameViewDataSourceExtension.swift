//
//  GameViewDataSourceExtension.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 25.09.23.
//

import UIKit

extension GameViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModal.gameEngine.gameBoardManager.gameBoard.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameInstanceCell.identifier, for: indexPath) as! GameInstanceCell
        
        viewModal.gameEngine.gameBoardManager.gameBoard[indexPath.row].indexPath = indexPath
        let instance = viewModal.gameEngine.gameBoardManager.gameBoard[indexPath.row]
        let swipeGestureRecognizer = CustomSwipeGestureRecognizer(target: self, action: #selector(handleSwipeGesture))
        cell.addGestureRecognizer(swipeGestureRecognizer)
    
        cell.configuration(gameInstance: instance)
        
        return cell
    }
    
    
}
