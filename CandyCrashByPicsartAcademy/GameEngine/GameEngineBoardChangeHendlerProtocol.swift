//
//  GameEngineBoardChangeHendlerProtocol.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 30.09.23.
//

import Foundation

protocol GameEngineBoardChangeHendler {
    var fallDownHendler: (([IndexPath]) -> Void)? { get set }
}
