//
//  GameInstances.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 25.09.23.
//

import Foundation

protocol GameInstance {
    var id: Int { get }  // A unique identifier for the game instance.
    var index: Int { get set }
    var image: GameInstanceImage { get }
}
