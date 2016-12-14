//
//  ChessEngineQueen.swift
//  Chess
//
//  Created by Ivo on 14/12/16.
//  Copyright © 2016 Ivano Rotondo. All rights reserved.
//

import Foundation

extension ChessEngine {
    
    func possibleMovesOfThisQueen(piece: Int, row: Int, col: Int) -> [[Int]] {
        
        var possibleMoves = [[Int]]()
        var adversaryInterval = getAdversaryInterval(piece)

        let possibleMovesLeft = checkLeft(adversaryInterval, row: row, col: col, once: false)
        let possibleMovesRight = checkRight(adversaryInterval, row: row, col: col, once: false)
        let possibleMovesUp = checkUp(adversaryInterval, row: row, col: col, once: false)
        let possibleMovesDown = checkDown(adversaryInterval, row: row, col: col, once: false)
        let possibleMovesLeftUp = checkLeftUp(adversaryInterval, row: row, col: col, once: false)
        let possibleMovesRightUp = checkRightUp(adversaryInterval, row: row, col: col, once: false)
        let possibleMovesLeftDown = checkLeftDown(adversaryInterval, row: row, col: col, once: false)
        let possibleMovesRightDown = checkRightDown(adversaryInterval, row: row, col: col, once: false)
        
        possibleMoves.appendContentsOf(possibleMovesLeft)
        possibleMoves.appendContentsOf(possibleMovesRight)
        possibleMoves.appendContentsOf(possibleMovesUp)
        possibleMoves.appendContentsOf(possibleMovesDown)
        possibleMoves.appendContentsOf(possibleMovesLeftUp)
        possibleMoves.appendContentsOf(possibleMovesRightUp)
        possibleMoves.appendContentsOf(possibleMovesLeftDown)
        possibleMoves.appendContentsOf(possibleMovesRightDown)
        
        return possibleMoves
    }
}

