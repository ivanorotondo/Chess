//
//  ChessEngineKing.swift
//  Chess
//
//  Created by Ivo on 14/12/16.
//  Copyright © 2016 Ivano Rotondo. All rights reserved.
//

import Foundation

extension ChessEngine {
    
    func possibleMovesOfThisKing(piece: Int, row: Int, col: Int) -> [[Int]] {
        
        var possibleMoves = [[Int]]()
        var adversaryInterval = getAdversaryInterval(piece)
        
        let possibleMovesLeft = checkLeft(adversaryInterval, row: row, col: col, once: true)
        let possibleMovesRight = checkRight(adversaryInterval, row: row, col: col, once: true)
        let possibleMovesUp = checkUp(adversaryInterval, row: row, col: col, once: true)
        let possibleMovesDown = checkDown(adversaryInterval, row: row, col: col, once: true)
        let possibleMovesLeftUp = checkLeftUp(adversaryInterval, row: row, col: col, once: true)
        let possibleMovesRightUp = checkRightUp(adversaryInterval, row: row, col: col, once: true)
        let possibleMovesLeftDown = checkLeftDown(adversaryInterval, row: row, col: col, once: true)
        let possibleMovesRightDown = checkRightDown(adversaryInterval, row: row, col: col, once: true)
        
        possibleMoves.appendContentsOf(possibleMovesLeft)
        possibleMoves.appendContentsOf(possibleMovesLeftUp)
        possibleMoves.appendContentsOf(possibleMovesUp)
        possibleMoves.appendContentsOf(possibleMovesRightUp)
        possibleMoves.appendContentsOf(possibleMovesRight)
        possibleMoves.appendContentsOf(possibleMovesRightDown)
        possibleMoves.appendContentsOf(possibleMovesDown)
        possibleMoves.appendContentsOf(possibleMovesLeftDown)
        
        return possibleMoves
    }
}