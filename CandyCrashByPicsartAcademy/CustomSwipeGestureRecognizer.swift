//
//  CustomSwipeGestureRecognizer.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 03.10.23.
//

import UIKit

//MARK: - Create a custom gesture recognizer for detecting swipe gestures
final class CustomSwipeGestureRecognizer: UIGestureRecognizer {
    private(set) var initialTouchLocation: CGPoint = .zero
    var swipeDirection: SwipeDirection = .none
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        
        if let touch = touches.first {
            initialTouchLocation = touch.location(in: view)
        }
    }
    
    // Handle the movement of a touch event
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        
        if state == .possible {
            if let touch = touches.first {
                let currentLocation = touch.location(in: view)
                let deltaX = currentLocation.x - initialTouchLocation.x
                let deltaY = currentLocation.y - initialTouchLocation.y
                
                // Detect horizontal swipe gestures (left or right)
                if abs(deltaX) >= 10 {
                    if deltaX > 0 {
                        swipeDirection = .right
                        state = .recognized
                    } else {
                        swipeDirection = .left
                        state = .recognized
                    }
                // Detect vertical swipe gestures (up or down)
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

