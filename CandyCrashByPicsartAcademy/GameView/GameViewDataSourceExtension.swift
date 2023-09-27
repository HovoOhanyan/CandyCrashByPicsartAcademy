//
//  GameViewDataSourceExtension.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 25.09.23.
//

import UIKit

extension GameViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModal.gameEngine.gameBoard.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameInstanceCell.identifier, for: indexPath) as! GameInstanceCell
        
        viewModal.gameEngine.gameBoard[indexPath.row].indexPath = indexPath
        let instance = viewModal.gameEngine.gameBoard[indexPath.row]
        cell.configuration(gameInstance: instance)
        cell.swipeGestureDelegate = self
        
        return cell
    }
    
    
}
