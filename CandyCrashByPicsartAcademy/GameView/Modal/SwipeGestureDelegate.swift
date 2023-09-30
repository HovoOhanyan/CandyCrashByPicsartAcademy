//
//  SwipeGestureDelegate.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 26.09.23.
//

import Foundation

protocol SwipeGestureDelegate: AnyObject {
    func swipeRightGesture(indexPaths: [IndexPath])
    func swipeLeftGesture(indexPaths: [IndexPath])
    func swipeUpGesture(indexPaths: [IndexPath])
    func swipeDownGesture(indexPaths: [IndexPath])
//    func fallDownGesture(index: Int)
}
