//
//  GameEngineBoardProtocol.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Hovo Ohanyan on 30.09.23.
//

import Foundation

protocol GameEngineBoard: AnyObject {
    var gameBoard: [GameInstance] { get set }
    var numberOfItemsInRow: Int { get }
    
    func createBoard()
}
