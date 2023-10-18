//
//  GameEngineTest.swift
//  GameEngineTest
//
//  Created by Hovo Ohanyan on 17.10.23.
//

import XCTest
@testable import CandyCrashByPicsartAcademy

final class GameEngineTest: XCTestCase {
    var gameBoardManager: GameEngineBoard!
    var gameSwipeManager: GameEngineSwipeGestureHandler!
    var gameCheckMatchesManager: GameEngineCheckManager!
    var gamePlayInformationManager: GameEnginePlayInformationManager!
    var gamePlayHandler: GameEngineBoardHandler!
    
    override func setUpWithError() throws {
        gameBoardManager = GameEngineBoardManager(numberOfItemsInRow: 10, boardSize: 100)
        
        gamePlayHandler = GameEngineBoardHandler()
        
        gamePlayInformationManager = GameEnginePlayInformationManager(score: 50, countOfSteps: 30, updatedStarEstimation: 85)
        
        gameCheckMatchesManager = GameEngineCheckManager(gameEngineBoardManager: gameBoardManager,
                                                         gameEngineBoardHandler: gamePlayHandler,
                                                         gamePlayInfo: gamePlayInformationManager)
        
        gameSwipeManager = GameEngineSwipeManager(gameBoardManager: gameBoardManager,
                                                  gamePlayInfo: gamePlayInformationManager, 
                                                  gameCheckManager: gameCheckMatchesManager)
    }

    override func tearDownWithError() throws {
        gameSwipeManager = nil
        gameBoardManager = nil
        gameCheckMatchesManager = nil
        gamePlayInformationManager = nil
        gamePlayHandler = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
