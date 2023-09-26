//
//  GameViewSwipeGestureDelegateExtension.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 26.09.23.
//

import UIKit

extension GameViewController: SwipeGestureDelegate {
    func swipeRightGesture(index: Int) {
        viewModal.gameEngine.swipeRightGesture(index: index)
        
        let firstIndexPath = IndexPath(item: index, section: 0)
        let secondIndexPath = IndexPath(item: index + 1, section: 0)
        
        UIView.animate(withDuration: 0.8) {
            self.collectionView.reloadItems(at: [firstIndexPath, secondIndexPath])
        }
    }
    
    func swipeLeftGesture(index: Int) {
        viewModal.gameEngine.swipeLeftGesture(index: index)
        
        let firstIndexPath = IndexPath(item: index, section: 0)
        let secondIndexPath = IndexPath(item: index - 1, section: 0)
        
        UIView.animate(withDuration: 0.8) {
            self.collectionView.reloadItems(at: [firstIndexPath, secondIndexPath])
        }
    }
    
    func swipeUpGesture(index: Int) {
        viewModal.gameEngine.swipeUpGesture(index: index)
        
        let firstIndexPath = IndexPath(item: index, section: 0)
        let secondIndexPath = IndexPath(item: index - viewModal.gameEngine.numberOfItemsInRow, section: 0)
        
        UIView.animate(withDuration: 0.8) {
            self.collectionView.reloadItems(at: [firstIndexPath, secondIndexPath])
        }
    }
    
    func swipeDownGesture(index: Int) {
        viewModal.gameEngine.swipeDownGesture(index: index)
        
        let firstIndexPath = IndexPath(item: index, section: 0)
        let secondIndexPath = IndexPath(item: index + viewModal.gameEngine.numberOfItemsInRow, section: 0)
        
        UIView.animate(withDuration: 0.8) {
            self.collectionView.reloadItems(at: [firstIndexPath, secondIndexPath])
        }
    }
    
    
}
