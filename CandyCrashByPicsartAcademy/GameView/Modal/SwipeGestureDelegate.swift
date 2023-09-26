//
//  SwipeGestureDelegate.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 26.09.23.
//

import Foundation

protocol SwipeGestureDelegate: AnyObject {
    func swipeRightGesture(index: Int)
    func swipeLeftGesture(index: Int)
    func swipeUpGesture(index: Int)
    func swipeDownGesture(index: Int)
//    func fallDownGesture(index: Int)
}
