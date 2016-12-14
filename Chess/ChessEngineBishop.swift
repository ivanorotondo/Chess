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
        possibleMoves.appendContentsOf(possibleMovesLeftDown)
        possibleMoves.appendContentsOf(possibleMovesRightDown)
        
        return possibleMoves
    }
    
    
    func checkLeftUp(adversaryInterval: [Int], row: Int, col: Int, once: Bool) -> [[Int]]{
        var possibleMoves = [[Int]]()
        var thisCol = col
        var thisRow = row
        while thisCol > 0 && thisRow < 7 {
            let thisPiece = chessboard[thisRow + 1][thisCol - 1]
            if thisPiece == 0 {
                possibleMoves.append([thisRow + 1, thisCol - 1])
                thisRow += 1
                thisCol -= 1
            } else if adversaryInterval.contains(thisPiece) {
                possibleMoves.append([thisRow + 1, thisCol - 1])
                thisCol = 0
            } else {
                thisCol = 0
            }
            
            if once == true {
                thisCol = 0
            }
        }
        
        return possibleMoves
    }
    
    
    func checkLeftDown(adversaryInterval: [Int], row: Int, col: Int, once: Bool) -> [[Int]]{
        var possibleMoves = [[Int]]()
        var thisCol = col
        var thisRow = row
        while thisCol > 0 && thisRow > 0 {
            let thisPiece = chessboard[thisRow - 1][thisCol - 1]
            if thisPiece == 0 {
                possibleMoves.append([thisRow - 1, thisCol - 1])
                thisRow -= 1
                thisCol -= 1
            } else if adversaryInterval.contains(thisPiece) {
                possibleMoves.append([thisRow - 1, thisCol - 1])
                thisCol = 0
            } else {
                thisCol = 0
            }
            
            if once == true {
                thisCol = 0
            }
        }
        
        return possibleMoves
    }
    
    
    func checkRightDown(adversaryInterval: [Int], row: Int, col: Int, once: Bool) -> [[Int]]{
        var possibleMoves = [[Int]]()
        var thisCol = col
        var thisRow = row
        while thisCol < 7 && thisRow > 0 {
            let thisPiece = chessboard[thisRow - 1][thisCol + 1]
            if thisPiece == 0 {
                possibleMoves.append([thisRow - 1, thisCol + 1])
                thisRow -= 1
                thisCol += 1
            } else if adversaryInterval.contains(thisPiece) {
                possibleMoves.append([thisRow - 1, thisCol + 1])
                thisCol = 8
            } else {
                thisCol = 8
            }
            
            if once == true {
                thisCol = 8
            }
        }
        
        return possibleMoves
    }
    
    
    func checkRightUp(adversaryInterval: [Int], row: Int, col: Int, once: Bool) -> [[Int]]{
        var possibleMoves = [[Int]]()
        var thisCol = col
        var thisRow = row
        while thisCol < 7 && thisRow < 7 {
            let thisPiece = chessboard[thisRow + 1][thisCol + 1]
            if thisPiece == 0 {
                possibleMoves.append([thisRow + 1, thisCol + 1])
                thisRow += 1
                thisCol += 1
            } else if adversaryInterval.contains(thisPiece) {
                possibleMoves.append([thisRow + 1, thisCol + 1])
                thisCol = 8
            } else {
                thisCol = 8
            }
            
            if once == true {
                thisCol = 8
            }
        }
        
        return possibleMoves
    }
    
}