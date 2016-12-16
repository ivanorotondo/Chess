//
//  ChessEngineBishop.swift
//  Chess
//
//  Created by Ivo on 14/12/16.
//  Copyright © 2016 Ivano Rotondo. All rights reserved.
//

import Foundation

extension ChessEngine {
    
    func possibleMovesOfThisBishop(piece: Int, row: Int, col: Int) -> [[Int]] {
        
        var possibleMoves = [[Int]]()
        
        var adversaryInterval = getAdversaryInterval(piece)
        
        let possibleMovesLeftUp = checkLeftUp(adversaryInterval, row: row, col: col, once: false)
        let possibleMovesRightUp = checkRightUp(adversaryInterval, row: row, col: col, once: false)
        let possibleMovesLeftDown = checkLeftDown(adversaryInterval, row: row, col: col, once: false)
        let possibleMovesRightDown = checkRightDown(adversaryInterval, row: row, col: col, once: false)

        possibleMoves.appendContentsOf(possibleMovesLeftUp)
        possibleMoves.appendContentsOf(possibleMovesRightUp)
        possibleMoves.appendContentsOf(possibleMovesRightDown)
        possibleMoves.appendContentsOf(possibleMovesLeftDown)

        
        return possibleMoves
    }
}