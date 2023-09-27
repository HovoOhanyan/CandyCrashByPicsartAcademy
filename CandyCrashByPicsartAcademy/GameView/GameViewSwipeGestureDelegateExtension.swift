//
//  GameViewSwipeGestureDelegateExtension.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 26.09.23.
//

import UIKit

extension GameViewController: SwipeGestureDelegate {
    func swipeRightGesture(indexPaths: [IndexPath]) {
        viewModal.gameEngine.swipeRightGesture(indexPaths: indexPaths)
        
            
            UIView.animate(withDuration: 0.1) {
                self.collectionView.reloadItems(at: indexPaths)
            }

    }
    
    func swipeLeftGesture(indexPaths: [IndexPath]) {
        viewModal.gameEngine.swipeLeftGesture(indexPaths: indexPaths)
        

            UIView.animate(withDuration: 0.1) {
                self.collectionView.reloadItems(at: indexPaths)
            }
        
    }
    
    func swipeUpGesture(indexPaths: [IndexPath]) {
        viewModal.gameEngine.swipeUpGesture(indexPaths: indexPaths)
        
            
            UIView.animate(withDuration: 0.8) {
                self.collectionView.reloadItems(at: indexPaths)
            }
        
    }
    
    func swipeDownGesture(indexPaths: [IndexPath]) {
        viewModal.gameEngine.swipeDownGesture(indexPaths: indexPaths)
        
            UIView.animate(withDuration: 0.8) {
                self.collectionView.reloadItems(at: indexPaths)
            }
        
    }
}
