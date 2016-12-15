//
//  ChessTests.swift
//  ChessTests
//
//  Created by Ivo on 12/12/16.
//  Copyright © 2016 Ivano Rotondo. All rights reserved.
//

import XCTest
@testable import Chess

class ChessEngineTestInit: XCTestCase {
    
    var chessEngine : ChessEngine!
    
    override func setUp() {
        super.setUp()
        
        chessEngine = ChessEngine()
        chessEngine.initChessboard()
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    
    func testInitialPawnsPosition() {
        for i in 0...7 {
            XCTAssert(chessEngine.getPieceInPosition(1, col: i) == 1)
            XCTAssert(chessEngine.getPieceInPosition(6, col: i) == 11)
        }
    }
    
    
    func testInitialRooksPosition() {
        
        XCTAssert(chessEngine.getPieceInPosition(0, col: 0) == 2)
        XCTAssert(chessEngine.getPieceInPosition(0, col: 7) == 2)
        XCTAssert(chessEngine.getPieceInPosition(7, col: 0) == 22)
        XCTAssert(chessEngine.getPieceInPosition(7, col: 7) == 22)
    }
    
    
    func testInitialKnightsPosition() {
        
        XCTAssert(chessEngine.getPieceInPosition(0, col: 1) == 3)
        XCTAssert(chessEngine.getPieceInPosition(0, col: 6) == 3)
        XCTAssert(chessEngine.getPieceInPosition(7, col: 1) == 33)
        XCTAssert(chessEngine.getPieceInPosition(7, col: 6) == 33)
    }
    
    
    func testInitialBishopsPosition() {
        
        XCTAssert(chessEngine.getPieceInPosition(0, col: 2) == 4)
        XCTAssert(chessEngine.getPieceInPosition(0, col: 5) == 4)
        XCTAssert(chessEngine.getPieceInPosition(7, col: 2) == 44)
        XCTAssert(chessEngine.getPieceInPosition(7, col: 5) == 44)
    }
    
    
    func testInitialQueensPosition() {
        
        XCTAssert(chessEngine.getPieceInPosition(0, col: 3) == 5)
        XCTAssert(chessEngine.getPieceInPosition(7, col: 3) == 55)
    }
    
    
    func testInitialKingsPosition() {
        
        XCTAssert(chessEngine.getPieceInPosition(0, col: 4) == 6)
        XCTAssert(chessEngine.getPieceInPosition(7, col: 4) == 66)
    }
    
    
    func testTotalPieces() {
        
        var emptyPosition = 0
        var whitePawns = 0
        var whiteRooks = 0
        var whiteKnights = 0
        var whiteBishops = 0
        var whiteQueens = 0
        var whiteKings = 0
        var blackPawns = 0
        var blackRooks = 0
        var blackKnights = 0
        var blackBishops = 0
        var blackQueens = 0
        var blackKings = 0
        
        for row in 0...chessEngine.chessboard.count - 1 {
            for col in 0...chessEngine.chessboard[0].count - 1 {
                
                switch chessEngine.chessboard[row][col] {
                case 0 : emptyPosition += 1
                    break
                case 1 : whitePawns += 1
                    break
                case 2 : whiteRooks += 1
                    break
                case 3 : whiteKnights += 1
                    break
                case 4 : whiteBishops += 1
                    break
                case 5 : whiteQueens += 1
                    break
                case 6 : whiteKings += 1
                    break
                case 11 : blackPawns += 1
                    break
                case 22 : blackRooks += 1
                    break
                case 33 : blackKnights += 1
                    break
                case 44 : blackBishops += 1
                    break
                case 55 : blackQueens += 1
                    break
                case 66 : blackKings += 1
                    break
                default:
                    break
                }
            }
        }
        
        
        XCTAssert(emptyPosition == 32)
        XCTAssert(whitePawns == 8)
        XCTAssert(whiteRooks == 2)
        XCTAssert(whiteKnights == 2)
        XCTAssert(whiteBishops == 2)
        XCTAssert(whiteQueens == 1)
        XCTAssert(whiteKings == 1)
        XCTAssert(blackPawns == 8)
        XCTAssert(blackRooks == 2)
        XCTAssert(blackKnights == 2)
        XCTAssert(blackBishops == 2)
        XCTAssert(blackQueens == 1)
        XCTAssert(blackKings == 1)
    }
    
    

}
