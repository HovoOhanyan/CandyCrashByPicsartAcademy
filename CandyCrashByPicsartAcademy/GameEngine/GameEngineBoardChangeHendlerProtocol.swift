//
//  GameEngineBoardChangeHendlerProtocol.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 30.09.23.
//

import Foundation

protocol GameEngineBoardChangeHandler: AnyObject {
    var fallDownHendler: (([IndexPath]) -> Void)? { get set }
}
