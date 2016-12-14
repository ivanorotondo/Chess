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
        
        var adversaryInterval : [Int]
        if piece == whiteBishop {
            adversaryInterval = [Int](11..<67)
        } else {
            adversaryInterval = [Int](1..<7)
        }
        
        //check left-up
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
        }
        
        
        //check left-down
        thisCol = col
        thisRow = row
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
        }
        
        
        //check right-down
        thisCol = col
        thisRow = row
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
        }
        
        
        //check right-up
        thisCol = col
        thisRow = row
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
        }
         
        return possibleMoves
    }
    
}