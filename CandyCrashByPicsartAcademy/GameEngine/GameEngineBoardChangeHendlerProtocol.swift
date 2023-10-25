//
//  GameEngineBoardChangeHendlerProtocol.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 30.09.23.
//

import Foundation

protocol GameEngineBoardChangeHandler: AnyObject {
    var reloadItems: (([Int]) -> Void)? { get set }
    var fallDownAtRow: (([Int]) -> Void)? { get set }
    var fallDownAtColumn: ((Int, Int) -> Void)? { get set }
    var updateLabelHandler: ((Int, Int) -> Void)? { get set }
    var updateCountOfStepsLabelHandler: ((Int) -> Void)? { get set }
    var updateStarChangesHandler: ((Int) -> Void)? { get set }
    var comboHandler: ((Int) -> Void)? { get set }
    var isUserInteractionEnabledHandler: ((Bool) -> Void)? { get set }
}
