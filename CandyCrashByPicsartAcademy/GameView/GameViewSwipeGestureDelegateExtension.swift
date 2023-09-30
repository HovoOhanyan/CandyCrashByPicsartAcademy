//
//  GameViewSwipeGestureDelegateExtension.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 26.09.23.
//

import UIKit

extension GameViewController: SwipeGestureDelegate {
    func swipeRightGesture(indexPaths: [IndexPath]) {
        viewModal.gameEngine.gameSwipeMeneger.swipeRightGesture(indexPaths: indexPaths)
        
            
            UIView.animate(withDuration: 0.8) {
                self.collectionView.reloadItems(at: indexPaths)
            }

        viewModal.gameEngine.gameCheckMatchsMeneger.checkMathes()
    }
    
    func swipeLeftGesture(indexPaths: [IndexPath]) {
        viewModal.gameEngine.gameSwipeMeneger.swipeLeftGesture(indexPaths: indexPaths)
        

            UIView.animate(withDuration: 0.8) {
                self.collectionView.reloadItems(at: indexPaths)
            }
        viewModal.gameEngine.gameCheckMatchsMeneger.checkMathes()
    }
    
    func swipeUpGesture(indexPaths: [IndexPath]) {
        viewModal.gameEngine.gameSwipeMeneger.swipeUpGesture(indexPaths: indexPaths)
        
            
            UIView.animate(withDuration: 0.8) {
                self.collectionView.reloadItems(at: indexPaths)
            }
        viewModal.gameEngine.gameCheckMatchsMeneger.checkMathes()
    }
    
    func swipeDownGesture(indexPaths: [IndexPath]) {
        viewModal.gameEngine.gameSwipeMeneger.swipeDownGesture(indexPaths: indexPaths)
        
            UIView.animate(withDuration: 0.8) {
                self.collectionView.reloadItems(at: indexPaths)
            }
        viewModal.gameEngine.gameCheckMatchsMeneger.checkMathes()
    }
}
