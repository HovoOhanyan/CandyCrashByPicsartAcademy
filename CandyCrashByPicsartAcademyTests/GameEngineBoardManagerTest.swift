//
//  GameEngineBoardManagerTest.swift
//  CandyCrashByPicsartAcademyTests
//
//  Created by Hovo Ohanyan on 18.10.23.
//

import XCTest
@testable import CandyCrashByPicsartAcademy

final class GameEngineBoardManagerTest: XCTestCase {
    var boardManager: GameEngineBoard!
    
    override func setUpWithError() throws {
        boardManager = GameEngineBoardManager(numberOfItemsInRow: 20, boardSize: 100)
    }

    override func tearDownWithError() throws {
        boardManager = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
}
