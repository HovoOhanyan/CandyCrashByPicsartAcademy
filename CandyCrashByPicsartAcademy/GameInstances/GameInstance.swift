//
//  GameInstances.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 25.09.23.
//

import Foundation

protocol GameInstance {
    var id: Int { get }
    var index: Int { get set }
    var image: GameInstanceImage { get }
}
