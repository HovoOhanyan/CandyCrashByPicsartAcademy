//
//  GameEngineUpdatesManager.swift
//  CandyCrashByPicsartAcademy
//
//  Created by Er Baghdasaryan on 01.10.23.
//

import Foundation

final class GameEngineUpdatesManager: GameEngineUpdates {
    
    private var tile = GameTile(type: .heart, isMatched: true)
//    private var gameData = GameDataStruct(score: 1, gameBoard: [[tile.self]])
    
    func gameStateChanged(gameData: GameDataStruct) {
        
    }
    
//    private func isExplosiveFruitMatched(matchedTiles: [GameTile]) -> Bool {
//        // Your logic to determine if the match contains an explosive fruit
//        // For example, you might have a property 'isExplosive' in GameTile
//        return matchedTiles.contains { tile in
//            tile.type == .explosiveFruit
//        }
//    }
    
    // Function to handle a match event
//    func handleMatch(matchedTiles: [GameTile]) {
//        if isExplosiveFruitMatched(matchedTiles: matchedTiles) {
//            // Update the score when an explosive fruit is matched
//            GameDataStruct.score += 100 // Update the score as needed
//            
//            // Notify the GameView about the score change
//            gameEngineBoardHendler?.updateScore(GameDataStruct.score)
//        }
//        
//        // Handle other match-related logic
//        // ...
//    }
        
}
