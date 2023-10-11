//
//  GameEngineHendlerProtocol.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 30.09.23.
//

import Foundation

protocol GameEngineSwipeGestureHandler {
    func swipeUpGesture(index: Int) -> Bool
    func swipeDownGesture(index: Int) -> Bool
    func swipeLeftGesture(index: Int) -> Bool
    func swipeRightGesture(index: Int) -> Bool
}
