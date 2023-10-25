//
//  GameDataToSave.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Er Baghdasaryan on 19.10.23.
//

struct GameDataToSave: Codable {
    let score: Int
    let countOfSteps: Int
    let updateStarEstimate: Int
    let id: Int
}
