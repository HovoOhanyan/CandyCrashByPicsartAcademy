//
//  GameEngineBoardHendler.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 30.09.23.
//

import Foundation

final class GameEngineBoardHendler: GameEngineBoardChangeHendler {
    var fallDownHendler: (([IndexPath]) -> Void)?
}
