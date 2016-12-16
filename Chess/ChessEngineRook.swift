//
//  ChessRook.swift
//  Chess
//
//  Created by Ivo on 13/12/16.
//  Copyright © 2016 Ivano Rotondo. All rights reserved.
//

import Foundation


extension ChessEngine {
    
    func possibleMovesOfThisRook(piece: Int, row: Int, col: Int) -> [[Int]] {
        
        var possibleMoves = [[Int]]()
        var adversaryInterval = getAdversaryInterval(piece)
        
        let possibleMovesLeft = checkLeft(adversaryInterval, row: row, col: col, once: false)
        let possibleMovesRight = checkRight(adversaryInterval, row: row, col: col, once: false)
        let possibleMovesUp = checkUp(adversaryInterval, row: row, col: col, once: false)
        let possibleMovesDown = checkDown(adversaryInterval, row: row, col: col, once: false)

        possibleMoves.appendContentsOf(possibleMovesLeft)
        possibleMoves.appendContentsOf(possibleMovesRight)
        possibleMoves.appendContentsOf(possibleMovesUp)
        possibleMoves.appendContentsOf(possibleMovesDown)
        
        return possibleMoves
    }
}