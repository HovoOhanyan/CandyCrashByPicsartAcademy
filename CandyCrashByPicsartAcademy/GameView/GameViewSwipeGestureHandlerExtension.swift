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
            if gestureRecognizer.view is GameInstanceCell {
                
                switch gestureRecognizer.swipeDirection {
                case .left:
                    print("")
                case .right:
                    print("")
                case .up:
                    print("")
                case .down:
                    print("")
                case .none:
                    break
                }
            }
        }
    }
}

