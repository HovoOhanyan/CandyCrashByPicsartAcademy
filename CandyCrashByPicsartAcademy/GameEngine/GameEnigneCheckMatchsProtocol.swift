//
//  GameEnigneCheckMatchsProtocol.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 30.09.23.
//

import Foundation

protocol GameEngineCheckMatches {
    func checkFiveMatchAtRow() -> Bool
    func checkFiveMatchAtColumn() -> Bool
    func checkFourMatchAtRow() -> Bool
    func checkFourMatchAtColumn() -> Bool
    func checkThreeMatchAtRow() -> Bool
    func checkThreeMatchAtColumn() -> Bool
    func checkMatches()
    func checkMatchForSwipeGesture() -> Bool
}
