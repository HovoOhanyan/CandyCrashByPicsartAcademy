//
//  GameViewSwipeGestureDelegateExtension.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 26.09.23.
//

import UIKit

extension GameViewController: SwipeGestureDelegate {
    func swipeRightGesture(indexPaths: [IndexPath]) {
        viewModel.gameEngine.gameSwipeMeneger.swipeRightGesture(indexPaths: indexPaths)
        
            
            UIView.animate(withDuration: 0.8) {
                self.collectionView.reloadItems(at: indexPaths)
            }

        viewModel.gameEngine.gameCheckMatchsMeneger.checkMathes()
    }
    
    func swipeLeftGesture(indexPaths: [IndexPath]) {
        viewModel.gameEngine.gameSwipeMeneger.swipeLeftGesture(indexPaths: indexPaths)
        

            UIView.animate(withDuration: 0.8) {
                self.collectionView.reloadItems(at: indexPaths)
            }
        viewModel.gameEngine.gameCheckMatchsMeneger.checkMathes()
    }
    
    func swipeUpGesture(indexPaths: [IndexPath]) {
        viewModel.gameEngine.gameSwipeMeneger.swipeUpGesture(indexPaths: indexPaths)
        
            
            UIView.animate(withDuration: 0.8) {
                self.collectionView.reloadItems(at: indexPaths)
            }
        viewModel.gameEngine.gameCheckMatchsMeneger.checkMathes()
    }
    
    func swipeDownGesture(indexPaths: [IndexPath]) {
        viewModel.gameEngine.gameSwipeMeneger.swipeDownGesture(indexPaths: indexPaths)
        
            UIView.animate(withDuration: 0.8) {
                self.collectionView.reloadItems(at: indexPaths)
            }
        viewModel.gameEngine.gameCheckMatchsMeneger.checkMathes()
    }
}
