//
//  GameEngineHendlerProtocol.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 30.09.23.
//

import Foundation

protocol GameEngineSwipeGestureHandler {
    func swipeUpGesture(indexPaths: [IndexPath]) -> Bool
    func swipeDownGesture(indexPaths: [IndexPath]) -> Bool
    func swipeLeftGesture(indexPaths: [IndexPath]) -> Bool
    func swipeRightGesture(indexPaths: [IndexPath]) -> Bool
}
