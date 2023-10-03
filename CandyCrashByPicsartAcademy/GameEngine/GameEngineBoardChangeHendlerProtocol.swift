//
//  GameEngineBoardChangeHendlerProtocol.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 30.09.23.
//

import Foundation

protocol GameEngineBoardChangeHandler: AnyObject {
    var fallDownHandler: (([IndexPath]) -> Void)? { get set }
    var updateScoreLabelHandler: ((Int) -> Void)? { get set }
    var updateCountOfStepsLabelHandler: ((Int) -> Void)? { get set }
    var updateStarChangesHandler: ((Int) -> Void)? { get set }
}
