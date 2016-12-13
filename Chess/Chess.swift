//
//  Chess.swift
//  Chess
//
//  Created by Ivo on 12/12/16.
//  Copyright © 2016 Ivano Rotondo. All rights reserved.
//

import Foundation

class Chess {
    
    var chessboard = Array(count: 8, repeatedValue: Array(count: 8, repeatedValue: 0))
    
    private let whitePawn = 1
    private let whiteRook = 2
    private let whiteKnight = 3
    private let whiteBishop = 4
    private let whiteQueen = 5
    private let whiteKing = 6
    
    private let blackPawn = 11
    private let blackRook = 22
    private let blackKnight = 33
    private let blackBishop = 44
    private let blackQueen = 55
    private let blackKing = 66
    
    
    func initialSetUp() {
        
        setInitialPawns()
        setInitialRooks()
        setInitialKnights()
        setInitialBishops()
        setInitialQueens()
        setInitialKings()
    }
    
    
    func getPieceInPosition(row: Int, col: Int) -> Int {
        return chessboard[row][col]
    }
    
    
    func setPieceInPosition(piece: Int, row: Int, col: Int){
        chessboard[row][col] = piece
    }
    
    
    func possibleMovesOfThisPiece(piece: Int, row: Int, col: Int) -> [[Int]]{
        
        switch piece {
        case 1, 11:
            return possibleMovesOfThisPawn(piece, row: row, col: col)
        case 2, 22:
            return possibleMovesOfThisRook(piece, row: row, col: col)
        default:
            return []
        }
    }
    
    
    private func possibleMovesOfThisPawn(piece: Int, row: Int, col: Int) -> [[Int]] {
        
        var possibleMoves = [[Int]]()
        var rowUp : Int
        var withinTop : Bool
        
        if piece == whitePawn {
            rowUp = row + 1
            withinTop = row < 7
        } else {
            rowUp = row - 1
            withinTop = row > 0
        }
        
        if withinTop {
            
            if chessboard[rowUp][col] == 0 {
                possibleMoves.append([rowUp, col])
            }
            
            if col > 0 {
                if chessboard[rowUp][col - 1] != 0 {
                    possibleMoves.append([rowUp, col - 1])
                }
            }
            
            if col < 7 {
                if chessboard[rowUp][col + 1] != 0 {
                    possibleMoves.append([rowUp, col + 1])
                }
            }
        }
        
        return possibleMoves
    }
    
    
    private func possibleMovesOfThisRook(piece: Int, row: Int, col: Int) -> [[Int]] {
        
        var possibleMoves = [[Int]]()
        
        //check left
        var thisCol = col
        while thisCol > 0 {
            if chessboard[row][thisCol - 1] == 0 {
                possibleMoves.append([row, thisCol - 1])
                thisCol -= 1
            } else {
                thisCol = 0
            }
        }
        
        //check right
        thisCol = col
        while thisCol < 7 {
            if chessboard[row][thisCol + 1] == 0 {
                possibleMoves.append([row, thisCol + 1])
                thisCol += 1
            } else {
                thisCol = 8
            }
        }
        
        //check up
        var thisRow = row
        while thisRow > 0 {
            if chessboard[thisRow - 1][col] == 0 {
                possibleMoves.append([thisRow - 1, col])
                thisRow -= 1
            } else {
                thisRow = 0
            }
        }
        
        //check down
        thisRow = row
        while thisRow < 7 {
            if chessboard[thisRow + 1][col] == 0 {
                possibleMoves.append([thisRow + 1, col])
                thisRow += 1
            } else {
                thisRow = 8
            }
        }
        
        return possibleMoves
    }
    
    
    private func setPieceInPositions(piece: Int, row: Int, col: [Int]) {
        
        for i in 0...col.count - 1 {
            chessboard[row][col[i]] = piece
        }
    }
    
    
    private func setInitialPawns() {
        
        setPieceInPositions(whitePawn, row: 1, col: [0,1,2,3,4,5,6,7])
        setPieceInPositions(blackPawn, row: 6, col: [0,1,2,3,4,5,6,7])
    }
    
    
    private func setInitialRooks() {
        setPieceInPositions(whiteRook, row: 0, col: [0,7])
        setPieceInPositions(blackRook, row: 7, col: [0,7])
    }
    
    
    private func setInitialKnights() {
        setPieceInPositions(whiteKnight, row: 0, col: [1,6])
        setPieceInPositions(blackKnight, row: 7, col: [1,6])
    }
    
    
    private func setInitialBishops() {
        setPieceInPositions(whiteBishop, row: 0, col: [2,5])
        setPieceInPositions(blackBishop, row: 7, col: [2,5])
    }
    
    
    private func setInitialQueens() {
        setPieceInPositions(whiteQueen, row: 0, col: [4])
        setPieceInPositions(blackQueen, row: 7, col: [3])
    }
    
    
    private func setInitialKings() {
        setPieceInPositions(whiteKing, row: 0, col: [3])
        setPieceInPositions(blackKing, row: 7, col: [4])
    }
}