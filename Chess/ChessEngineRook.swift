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
        
        var adversaryInterval : [Int]
        if piece == whiteRook {
            adversaryInterval = [Int](11..<67)
        } else {
            adversaryInterval = [Int](1..<7)
        }
        
        //check left
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
        }
        
        //check right
        thisCol = col
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
        }
        
        //check up
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
        }
        
        //check down
        thisRow = row
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
        }
        
        return possibleMoves
    }
}