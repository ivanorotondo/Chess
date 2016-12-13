//
//  ChessKnight.swift
//  Chess
//
//  Created by Ivo on 13/12/16.
//  Copyright © 2016 Ivano Rotondo. All rights reserved.
//

import Foundation

extension ChessEngine {
    
    func possibleMovesOfThisKnight(piece: Int, row: Int, col: Int) -> [[Int]] {
    
        var possibleMoves = [[Int]]()
        
        var adversaryInterval : [Int]
        if piece == whiteKnight {
            adversaryInterval = [Int](11..<67)
        } else {
            adversaryInterval = [Int](1..<7)
        }
        
        var possibleRows = [Int](count: 4, repeatedValue: -1)
        var possibleCols = [Int](count: 4, repeatedValue: -1)
        
        if row > 0 {
            possibleRows[0] = row - 1
            if row > 1 {
                possibleRows[2] = row - 2
            }
        }
        if row < 7 {
            possibleRows[1] = row + 1
            if row < 6 {
                possibleRows[3] = row + 2
            }
        }
        
        if col > 0 {
            possibleCols[0] = col - 1
            if col > 1 {
                possibleCols[2] = col - 2
            }
        }
        if col < 7 {
            possibleCols[1] = col + 1
            if col < 6 {
                possibleCols[3] = col + 2
            }
        }
        
        for (indexRow, row) in possibleRows.enumerate() {
            for (indexCol, col) in possibleCols.enumerate() {
                if (indexRow <= 1 && indexCol >= 2) || indexCol <= 1 && indexRow >= 2 {
                    if row != -1 && col != -1 {
                        
                        let thisPossibleMove = chessboard[row][col]
                        if thisPossibleMove == 0 || adversaryInterval.contains(thisPossibleMove) {
                            possibleMoves.append([row, col])
                        }
                    }
                }
            }
        }
        
        return possibleMoves
    }
}