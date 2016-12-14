//
//  Chess.swift
//  Chess
//
//  Created by Ivo on 12/12/16.
//  Copyright © 2016 Ivano Rotondo. All rights reserved.
//

import Foundation

class ChessEngine {
    
    var chessboard = Array(count: 8, repeatedValue: Array(count: 8, repeatedValue: 0))
    
    let whitePawn = 1
    let whiteRook = 2
    let whiteKnight = 3
    let whiteBishop = 4
    let whiteQueen = 5
    let whiteKing = 6
    
    let blackPawn = 11
    let blackRook = 22
    let blackKnight = 33
    let blackBishop = 44
    let blackQueen = 55
    let blackKing = 66
    
    
    func initialSetUp() {
        
        chessboard = [[0, 3, 0, 6, 5, 0, 3, 0],
                      [1, 1, 1, 1, 1, 1, 1, 1],
                      [0, 0, 0, 0, 0, 0, 4, 0],
                      [2, 0, 0, 0, 0, 0, 0, 0],
                      [0, 0, 33, 0, 0, 0, 0, 0],
                      [22, 0, 0, 0, 4, 2, 0, 22],
                      [11, 11, 11, 11, 11, 11, 11, 11],
                      [0, 0, 44, 66, 55, 44, 33, 0]]
        
//        setInitialPawns()
//        setInitialRooks()
//        setInitialKnights()
//        setInitialBishops()
//        setInitialQueens()
//        setInitialKings()
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
        case 3, 33:
            return possibleMovesOfThisKnight(piece, row: row, col: col)
        case 4, 44:
            return possibleMovesOfThisBishop(piece, row: row, col: col)
        default:
            return []
        }
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