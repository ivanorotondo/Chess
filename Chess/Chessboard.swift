//
//  Chessboard.swift
//  Chess
//
//  Created by Ivo on 12/12/16.
//  Copyright © 2016 Ivano Rotondo. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable
class Chessboard: UIView {
        
    var chessEngine : ChessEngine?
    var squareLength : CGFloat!
    var piecesImageArray = [UIImageView]()
    
    var lastTappedPiecePosition = [Int]()
    
    override func drawRect(rect: CGRect) {
        
        squareLength = bounds.width/8

        drawChessboardSquares()
        drawMoves()
        drawPieces(chessEngine!.chessboard)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(pieceWasTapped))
        self.userInteractionEnabled = true
        self.addGestureRecognizer(tapRecognizer)
    }
    
    
    @objc private func pieceWasTapped(sender: UITapGestureRecognizer) {
        
        let (row, col) = getPositionOfPoint(sender.locationInView(self).x, y: sender.locationInView(self).y)
        
        //checkIfHighlighted -> move piece
        if positionIsHighlighted(row, col: col) {
            hideOldHighlightedPositions()
            removeAllPieces()
            movePieceFromPosition(lastTappedPiecePosition, toPosition: [row, col])
        } else {
            
            showMovesForThisPiece(row, col: col)
        }
        
        lastTappedPiecePosition = [row, col]
    }
    
    
    private func movePieceFromPosition(position: [Int], toPosition: [Int]) {
        
        let piece = chessEngine?.getPieceInPosition(position[0], col: position[1])
        chessEngine?.setPieceInPosition(0, row: position[0], col: position[1])
        chessEngine?.setPieceInPosition(piece!, row: toPosition[0], col: toPosition[1])
        self.setNeedsDisplay()
    }
    
    
    private func showMovesForThisPiece(row: Int, col: Int) {
        
        hideOldHighlightedPositions()
        
        let piece = chessEngine!.getPieceInPosition(row, col: col)
        let possibleMoves = chessEngine!.possibleMovesOfThisPiece(piece, row: row, col: col)
        
        markHighlightedPositions(possibleMoves)
        self.setNeedsDisplay()
    }
    
    
    private func getPositionOfPoint(x: CGFloat, y: CGFloat) -> (Int, Int){
        let row = 7 - Int(y / squareLength)
        let col = Int(x / squareLength)
        return (row, col)
    }
    
    
    private func getRectOfPosition(row: Int, col: Int) -> CGRect {
        let x = (CGFloat(col - 1)) * squareLength
        let y = (CGFloat(8 - row)) * squareLength
        return  CGRect(x: x, y: y, width: squareLength, height: squareLength)
    }
    
    
    private func positionIsHighlighted(row: Int, col: Int) -> Bool {
        
        let thisPiece = chessEngine?.chessboard[row][col]
        if thisPiece < 0 {
            return true
        } else {
            return false
        }
    }
    
    
    private func hideOldHighlightedPositions() {
        
        for row in 1...8 {
            for col in 1...8{
                let thisPiece = chessEngine?.chessboard[row - 1][col - 1]
                if thisPiece < 0 {
                    chessEngine?.chessboard[row - 1][col - 1] = 100 + thisPiece!
                }
            }
        }
    }
    
    
    private func markHighlightedPositions(positions: [[Int]]) {
        
        for position in positions {
            let thisPiece = chessEngine?.chessboard[position[0]][position[1]]
            chessEngine?.chessboard[position[0]][position[1]] = thisPiece! - 100
        }
    }
    
    
    private func drawChessboardSquares() {
        func isEven(number: Int) -> Bool {
            if number % 2 != 0 {
                return true
            } else {
                return false
            }
        }
        
        for row in 1...8 {
            for col in 1...8{
                
                let square = getRectOfPosition(row, col: col)
                var squareBP:UIBezierPath = UIBezierPath(rect: square)
                
                if (isEven(row) && isEven(col)) || (!isEven(row) && !isEven(col)) {
                    UIColor.blackColor().setStroke()
                    squareBP.lineWidth = 0
                    squareBP.fill()
                    squareBP.stroke()
                }
            }
        }
    }
    
    private func drawMoves() {
        for row in 1...8 {
            for col in 1...8{
                
                let square = getRectOfPosition(row, col: col)
                var squareBP:UIBezierPath = UIBezierPath(rect: square)
                
                if chessEngine?.chessboard[row - 1][col - 1] < 0 {
                    UIColor.redColor().setStroke()
                    squareBP.lineWidth = 3
                    squareBP.stroke()
                }
            }
        }
    }
    
    
    private func drawLines(squareLength : CGFloat) {
        
        var spanArray = [0, squareLength, 2 * squareLength, 3 * squareLength, 4*squareLength, 5*squareLength, 6*squareLength, 7*squareLength, 8*squareLength]
        
        for span in spanArray {
            var verticalLine = UIBezierPath()
            var horizontalLine = UIBezierPath()
            
            verticalLine.lineWidth = 1
            horizontalLine.lineWidth = 1
            
            verticalLine.moveToPoint(CGPoint(x: span, y: 0))
            horizontalLine.moveToPoint(CGPoint(x: 0,y: span))
            
            verticalLine.addLineToPoint(CGPoint(x: span,y: bounds.height))
            horizontalLine.addLineToPoint(CGPoint(x: bounds.height, y: span))
            
            UIColor.blackColor().setStroke()
            verticalLine.stroke()
            horizontalLine.stroke()
        }
    }
    
    
    private func removeAllPieces() {
        for piece in piecesImageArray {
            piece.removeFromSuperview()
        }
    }
    
    
    private func drawPieces(chessboard: [[Int]]) {
        
        for row in 1...8 {
            for col in 1...8{
                
                let piece = chessboard[row - 1][col - 1]
                
                if piece != 0 {
                    
                    let rect = getRectOfPosition(row, col: col)
                    let pieceImage = UIImageView(frame: rect)
                    
                    switch piece {
                    case 1: pieceImage.image = UIImage(named: "PawnWhite.png")
                        break
                    case 2: pieceImage.image = UIImage(named: "RookWhite.png")
                        break
                    case 3: pieceImage.image = UIImage(named: "KnightWhite.png")
                        break
                    case 4: pieceImage.image = UIImage(named: "BishopWhite.png")
                        break
                    case 5: pieceImage.image = UIImage(named: "QueenWhite.png")
                        break
                    case 6: pieceImage.image = UIImage(named: "KingWhite.png")
                        break
                    case 11: pieceImage.image = UIImage(named: "PawnBlack.png")
                        break
                    case 22: pieceImage.image = UIImage(named: "RookBlack.png")
                        break
                    case 33: pieceImage.image = UIImage(named: "KnightBlack.png")
                        break
                    case 44: pieceImage.image = UIImage(named: "BishopBlack.png")
                        break
                    case 55: pieceImage.image = UIImage(named: "QueenBlack.png")
                        break
                    case 66: pieceImage.image = UIImage(named: "KingBlack.png")
                        break
                    default:
                        break
                    }
                    
                    piecesImageArray.append(pieceImage)
                    addSubview(pieceImage)
                }
            }
        }
    }
}
