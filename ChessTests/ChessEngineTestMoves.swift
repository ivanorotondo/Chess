//
//  ChessEngineTestMoves.swift
//  Chess
//
//  Created by Ivo on 15/12/16.
//  Copyright © 2016 Ivano Rotondo. All rights reserved.
//

import XCTest
@testable import Chess

class ChessEngineTestMoves: XCTestCase {
    
    var chessEngine : ChessEngine!
    
    override func setUp() {
        super.setUp()
        
        chessEngine = ChessEngine()
        chessEngine.initChessboard()
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    
    func testMovesPawns() {
        
        XCTAssert(chessEngine.possibleMovesOfThisPiece(1, row: 1, col: 4) == [[2, 4]])
        
        chessEngine.setPieceInPosition(11, row: 2, col: 6)
        chessEngine.setPieceInPosition(11, row: 1, col: 7)
        XCTAssert(chessEngine.possibleMovesOfThisPiece(1, row: 1, col: 7) == [[2, 7],[2, 6]])
        XCTAssert(chessEngine.possibleMovesOfThisPiece(11, row: 2, col: 6) == [[1, 5]])
        
        chessEngine.setPieceInPosition(11, row: 2, col: 1)
        chessEngine.setPieceInPosition(11, row: 2, col: 2)
        chessEngine.setPieceInPosition(11, row: 2, col: 3)
        XCTAssert(chessEngine.possibleMovesOfThisPiece(1, row: 1, col: 2) == [[2, 1],[2, 3]])
        
        XCTAssert(chessEngine.possibleMovesOfThisPiece(1, row: 7, col: 3) == [])
    }
    
    
    func testMovesRooks() {
        
        chessEngine.setPieceInPosition(2, row: 2, col: 0)
        XCTAssert(chessEngine.possibleMovesOfThisPiece(2, row: 2, col: 0) == [[2, 1],[2, 2],[2, 3],[2, 4],[2, 5],[2, 6],[2, 7], [3,0],[4,0],[5,0],[6,0]])
        
        chessEngine.setPieceInPosition(2, row: 3, col: 0)
        XCTAssert(chessEngine.possibleMovesOfThisPiece(2, row: 2, col: 0) == [[2, 1],[2, 2],[2, 3],[2, 4],[2, 5],[2, 6],[2, 7]])
        XCTAssert(chessEngine.possibleMovesOfThisPiece(2, row: 3, col: 0) == [[3, 1],[3, 2],[3, 3],[3, 4],[3, 5],[3, 6],[3, 7],[4,0],[5,0],[6,0]])
    }
    
    
    func testMovesKnights() {
        
        XCTAssert(chessEngine.possibleMovesOfThisPiece(3, row: 0, col: 1) == [[2,0],[2,2]])
        chessEngine.setPieceInPosition(3, row: 5, col: 4)
        chessEngine.setPieceInPosition(1, row: 3, col: 5)
        XCTAssert(chessEngine.possibleMovesOfThisPiece(3, row: 5, col: 4) == [[4,2],[4,6],[6,2],[6,6],[3,3],[7,3],[7,5]])
    }
    
    
    func testMovesBishops() {
        
        chessEngine.setPieceInPosition(4, row: 2, col: 4)
        XCTAssert(chessEngine.possibleMovesOfThisPiece(4, row: 2, col: 4) == [[3, 3],[4, 2],[5, 1],[6, 0],[3, 5],[4, 6],[5, 7]])
        chessEngine.setPieceInPosition(4, row: 4, col: 2)
        XCTAssert(chessEngine.possibleMovesOfThisPiece(4, row: 4, col: 2) == [[5, 1],[6, 0],[5, 3],[6, 4],[3, 3],[3, 1],[2, 0]])
    }
    
    
    func testMovesQueen() {
        
        chessEngine.setPieceInPosition(5, row: 3, col: 3)
        XCTAssert(chessEngine.possibleMovesOfThisPiece(5, row: 3, col: 3) == [[3, 2],[3, 1],[3, 0],[4, 2],[5, 1],[6, 0],[4, 3],[5, 3],[6, 3],[4, 4],[5, 5],[6, 6],[3, 4],[3, 5],[3, 6],[3, 7],[2, 4],[2, 3],[2, 2]])
    }
}
