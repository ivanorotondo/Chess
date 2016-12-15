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
    
    func checkDown(adversaryInterval: [Int], row: Int, col: Int, once: Bool) -> [[Int]]{
        var possibleMoves = [[Int]]()
        var thisRow = row
        while thisRow > 0 {
            let thisPiece = chessboard[thisRow - 1][col]
            if thisPiece == 0 {
                possibleMoves.append([thisRow - 1, col])
                thisRow -= 1
            } else if adversaryInterval.contains(thisPiece) {
                possibleMoves.append([thisRow - 1, col])
                thisRow = 0
            } else {
                thisRow = 0
            }
            
            if once == true {
                thisRow = 0
            }
        }
        
        return possibleMoves
    }
    
    
    func checkUp(adversaryInterval: [Int], row: Int, col: Int, once: Bool) -> [[Int]] {
        var possibleMoves = [[Int]]()
        var thisRow = row
        while thisRow < 7 {
            let thisPiece = chessboard[thisRow + 1][col]
            if thisPiece == 0 {
                possibleMoves.append([thisRow + 1, col])
                thisRow += 1
            } else if adversaryInterval.contains(thisPiece) {
                possibleMoves.append([thisRow + 1, col])
                thisRow = 8
            } else {
                thisRow = 8
            }
            
            
            if once == true {
                thisRow = 8
            }
        }
        return possibleMoves
    }
    
    
    func checkRight(adversaryInterval: [Int], row: Int, col: Int, once: Bool) -> [[Int]] {
        var possibleMoves = [[Int]]()
        var thisCol = col
        while thisCol < 7 {
            let thisPiece = chessboard[row][thisCol + 1]
            if thisPiece == 0 {
                possibleMoves.append([row, thisCol + 1])
                thisCol += 1
            } else if adversaryInterval.contains(thisPiece) {
                possibleMoves.append([row, thisCol + 1])
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
    
    
    func checkLeft(adversaryInterval: [Int], row: Int, col: Int, once: Bool) -> [[Int]] {
        var possibleMoves = [[Int]]()
        var thisCol = col
        while thisCol > 0 {
            let thisPiece = chessboard[row][thisCol - 1]
            if thisPiece == 0 {
                possibleMoves.append([row, thisCol - 1])
                thisCol -= 1
            } else if adversaryInterval.contains(thisPiece) {
                possibleMoves.append([row, thisCol - 1])
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

}