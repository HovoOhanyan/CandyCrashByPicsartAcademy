//
//  GameEngineBoardHendler.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 30.09.23.
//

import Foundation

final class GameEngineBoardHandler: GameEngineBoardChangeHandler {
    var reloadItems: (([Int]) -> Void)?
    var fallDownAtRow: (([Int]) -> Void)?
    var fallDownAtColumn: ((Int, Int) -> Void)?
    var updateLabelHandler: ((Int, Int) -> Void)?
    var updateCountOfStepsLabelHandler: ((Int) -> Void)?
    var updateStarChangesHandler: ((Int) -> Void)?
    var comboHandler: ((Int) -> Void)?
    var isUserInteractionEnabledHandler: ((Bool) -> Void)?
}
