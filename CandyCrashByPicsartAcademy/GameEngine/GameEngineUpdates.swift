//
//  GameEngineUpdates.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Er Baghdasaryan on 01.10.23.
//

import Foundation

protocol GameEngineUpdates: AnyObject {
    func gameStateChanged(gameData: GameDataStruct)
}

