//
//  ChessPawn.swift
//  Chess
//
//  Created by Ivo on 13/12/16.
//  Copyright © 2016 Ivano Rotondo. All rights reserved.
//

import Foundation

extension ChessEngine {
    
    func possibleMovesOfThisPawn(piece: Int, row: Int, col: Int) -> [[Int]] {
        
        var possibleMoves = [[Int]]()
        var rowUp : Int
        var withinTop : Bool
        var adversaryInterval : [Int]
        if piece == whitePawn {
            rowUp = row + 1
            withinTop = row < 7
            adversaryInterval = [Int](11..<67)
        } else {
            rowUp = row - 1
            withinTop = row > 0
            adversaryInterval = [Int](1..<7)
        }
        
        if withinTop {
            
            if chessboard[rowUp][col] == 0 {
                possibleMoves.append([rowUp, col])
            }
            
            if col > 0 {
                let thisPiece = chessboard[rowUp][col - 1]
                if thisPiece != 0 && adversaryInterval.contains(thisPiece) {
                    possibleMoves.append([rowUp, col - 1])
                }
            }
            
            if col < 7 {
                let thisPiece = chessboard[rowUp][col + 1]
                
                if thisPiece != 0 && adversaryInterval.contains(thisPiece) {
                    possibleMoves.append([rowUp, col + 1])
                }
            }
        }
        
        return possibleMoves
    }
}