//
//  GameEngineHendlerProtocol.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 30.09.23.
//

import Foundation

protocol GameEngineSwipeGestureHandler {
    func swipeUpGesture(indexPaths: [IndexPath])
    func swipeDownGesture(indexPaths: [IndexPath])
    func swipeLeftGesture(indexPaths: [IndexPath])
    func swipeRightGesture(indexPaths: [IndexPath])
}
