//
//  GameViewSwipeGestureDelegateExtension.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 26.09.23.
//

import UIKit

extension GameViewController: SwipeGestureDelegate {
    func swipeRightGesture(indexPaths: [IndexPath]) {
        viewModal.gameEngine.gameSwipeManager.swipeRightGesture(indexPaths: indexPaths)
        
            
            UIView.animate(withDuration: 0.8) {
                self.collectionView.reloadItems(at: indexPaths)
            }

        viewModal.gameEngine.gameCheckMatchsManager.checkMathes()
    }
    
    func swipeLeftGesture(indexPaths: [IndexPath]) {
        viewModal.gameEngine.gameSwipeManager.swipeLeftGesture(indexPaths: indexPaths)
        

            UIView.animate(withDuration: 0.8) {
                self.collectionView.reloadItems(at: indexPaths)
            }
        viewModal.gameEngine.gameCheckMatchsManager.checkMathes()
    }
    
    func swipeUpGesture(indexPaths: [IndexPath]) {
        viewModal.gameEngine.gameSwipeManager.swipeUpGesture(indexPaths: indexPaths)
        
            
            UIView.animate(withDuration: 0.8) {
                self.collectionView.reloadItems(at: indexPaths)
            }
        viewModal.gameEngine.gameCheckMatchsManager.checkMathes()
    }
    
    func swipeDownGesture(indexPaths: [IndexPath]) {
        viewModal.gameEngine.gameSwipeManager.swipeDownGesture(indexPaths: indexPaths)
        
            UIView.animate(withDuration: 0.8) {
                self.collectionView.reloadItems(at: indexPaths)
            }
        viewModal.gameEngine.gameCheckMatchsManager.checkMathes()
    }
}
