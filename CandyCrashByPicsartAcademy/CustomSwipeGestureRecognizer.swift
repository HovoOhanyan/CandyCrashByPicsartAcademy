//
//  CustomSwipeGestureRecognizer.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 03.10.23.
//

import UIKit

final class CustomSwipeGestureRecognizer: UIGestureRecognizer {
    private var initialTouchLocation: CGPoint = .zero
    
    var swipeDirection: SwipeDirection = .none
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        
        if let touch = touches.first {
            print(initialTouchLocation.x)
            initialTouchLocation = touch.location(in: view)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        
        if state == .possible {
            if let touch = touches.first {
                let currentLocation = touch.location(in: view)
                let deltaX = currentLocation.x - initialTouchLocation.x
                let deltaY = currentLocation.y - initialTouchLocation.y
                
                if abs(deltaX) >= 10 {
                    if deltaX > 0 {
                        swipeDirection = .right
                        state = .recognized
                    } else {
                        swipeDirection = .left
                        state = .recognized
                    }
                } else if abs(deltaY) >= 10 {
                    if deltaY > 0 {
                        swipeDirection = .down
                        state = .recognized
                    } else {
                        swipeDirection = .up
                        state = .recognized
                    }
                }
            }
        }
    }
}

