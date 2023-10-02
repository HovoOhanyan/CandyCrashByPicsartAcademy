//
//  GameDataStruct.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Er Baghdasaryan on 01.10.23.
//

import Foundation

struct GameDataStruct {
    var score: Int
//    var combo: Int
    var gameBoard: [[GameTile]]
}

struct GameTile {
    var type: GameInstanceImage
    var isMatched: Bool
}
