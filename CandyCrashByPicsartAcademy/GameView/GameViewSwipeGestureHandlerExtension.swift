//
//  GameViewSwipeGestureDelegateExtension.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 26.09.23.
//

import UIKit

extension GameViewController {
    @objc func handleSwipeGesture(_ gestureRecognizer: CustomSwipeGestureRecognizer) {
        
        if gestureRecognizer.state == .recognized {
            if let cell = gestureRecognizer.view as? GameInstanceCell, let indexPath = collectionView.indexPath(for: cell) {
               
                switch gestureRecognizer.swipeDirection {
                case .left:
                    let nextIndexPath = IndexPath(item: indexPath.item - 1, section: indexPath.section)
                    if viewModal.gameEngine.gameSwipeManager.swipeLeftGesture(indexPaths:  [indexPath, nextIndexPath]) {
                        
                        UIView.animate(withDuration: 0.5) {
                            self.collectionView.reloadItems(at: [indexPath, nextIndexPath])
                        }
                        
                        viewModal.gameEngine.gameCheckMatchsManager.checkMatches()
                    } else {
                        UIView.animate(withDuration: 0.5) {
                            self.collectionView.reloadItems(at: [indexPath, nextIndexPath])
                        }
                    }
                    
                case .right:
                    let nextIndexPath = IndexPath(item: indexPath.item + 1, section: indexPath.section)
                    
                    if viewModal.gameEngine.gameSwipeManager.swipeRightGesture(indexPaths:  [indexPath, nextIndexPath]) {
                        
                        UIView.animate(withDuration: 0.5) {
                            self.collectionView.reloadItems(at: [indexPath, nextIndexPath])
                        }
                        
                        viewModal.gameEngine.gameCheckMatchsManager.checkMatches()
                    } else {
                        UIView.animate(withDuration: 0.5) {
                            self.collectionView.reloadItems(at: [indexPath, nextIndexPath])
                        }
                    }
                    
                case .up:
                    let numberOfItemsInRow = viewModal.gameEngine.gameBoardManager.numberOfItemsInRow
                    
                    let nextIndexPath = IndexPath(item: indexPath.item - numberOfItemsInRow, section: indexPath.section)
                    
                    if viewModal.gameEngine.gameSwipeManager.swipeUpGesture(indexPaths:  [indexPath, nextIndexPath]) {
                        
                        UIView.animate(withDuration: 0.5) {
                            self.collectionView.reloadItems(at: [indexPath, nextIndexPath])
                        }
                        
                        viewModal.gameEngine.gameCheckMatchsManager.checkMatches()
                    } else {
                        UIView.animate(withDuration: 0.5) {
                            self.collectionView.reloadItems(at: [indexPath, nextIndexPath])
                        }
                    }
                    
                case .down:
                    let numberOfItemsInRow = viewModal.gameEngine.gameBoardManager.numberOfItemsInRow
                    
                    let nextIndexPath = IndexPath(item: indexPath.item + numberOfItemsInRow, section: indexPath.section)
                    
                    if viewModal.gameEngine.gameSwipeManager.swipeDownGesture(indexPaths:  [indexPath, nextIndexPath]) {
                        
                        UIView.animate(withDuration: 0.5) {
                            self.collectionView.reloadItems(at: [indexPath, nextIndexPath])
                        }
                        
                        viewModal.gameEngine.gameCheckMatchsManager.checkMatches()
                    } else {
                        UIView.animate(withDuration: 0.5) {
                            self.collectionView.reloadItems(at: [indexPath, nextIndexPath])
                        }
                    }
                    
                case .none:
                    break
                }
            }
        }
    }
}
