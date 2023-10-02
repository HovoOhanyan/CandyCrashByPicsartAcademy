//
//  GameEngineBoardHendler.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 30.09.23.
//

import Foundation

final class GameEngineBoardHandler: GameEngineBoardChangeHandler {
    var fallDownHandler: (([IndexPath]) -> Void)?
}
