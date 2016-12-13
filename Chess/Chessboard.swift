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
    
    @IBInspectable var fillColor: UIColor = UIColor.greenColor()
    
    var chess : Chess?
    var squareLength : CGFloat!
    
    
    override func drawRect(rect: CGRect) {
        
        squareLength = bounds.width/8

//        drawLines(squareLength)
        drawSquares()
        drawPieces(chess!.chessboard)
        
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
                    
                    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(pieceWasTapped))
                    pieceImage.userInteractionEnabled = true
                    pieceImage.addGestureRecognizer(tapRecognizer)
                    addSubview(pieceImage)
                }
            }
        }
    }
    
    
    @objc private func pieceWasTapped(sender: UITapGestureRecognizer) {
        let (row, col) = pointToPosition(sender.locationInView(self).x, y: sender.locationInView(self).y)
        showMovesForThisPiece(row, col: col)
//        print("row: \(row), col: \(col)")
    }
    
    
    private func showMovesForThisPiece(row: Int, col: Int) {
        
        hideOldHighlightedPositions()
        
        let piece = chess!.getPieceInPosition(row, col: col)
        let possibleMoves = chess!.possibleMovesOfThisPiece(piece, row: row, col: col)
        
        markHighlightedPositions(possibleMoves)
        self.setNeedsDisplay()
    }
    
    
    private func pointToPosition(x: CGFloat, y: CGFloat) -> (Int, Int){
        let row = 7 - Int(y / squareLength)
        let col = Int(x / squareLength)
        return (row, col)
    }
    
    
    private func getRectOfPosition(row: Int, col: Int) -> CGRect {
        let x = (CGFloat(col - 1)) * squareLength
        let y = (CGFloat(8 - row)) * squareLength
        return  CGRect(x: x, y: y, width: squareLength, height: squareLength)
    }
    
    
    private func hideOldHighlightedPositions() {
        
        for row in 1...8 {
            for col in 1...8{
                let thisPiece = chess?.chessboard[row - 1][col - 1]
                if thisPiece < 0 {
                    chess?.chessboard[row - 1][col - 1] = 100 + thisPiece!
                }
            }
        }
    }
    
    
    private func markHighlightedPositions(positions: [[Int]]) {
        
        for position in positions {
            let thisPiece = chess?.chessboard[position[0]][position[1]]
            chess?.chessboard[position[0]][position[1]] = thisPiece! - 100
        }
    }
    
    
    private func drawSquares() {
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
        
        for row in 1...8 {
            for col in 1...8{
                
                let square = getRectOfPosition(row, col: col)
                var squareBP:UIBezierPath = UIBezierPath(rect: square)
                
                if chess?.chessboard[row - 1][col - 1] < 0 {
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
    
    
    var initialConfiguration = [[2, 3, 4, 5, 6, 4, 3, 2],
                                [1, 1, 1, 1, 1, 1, 1, 1],
                                [0, 0, 0, 0, 0, 0, 0, 0],
                                [0, 0, 0, 0, 0, 0, 0, 0],
                                [0, 0, 0, 0, 0, 0, 0, 0],
                                [0, 0, 0, 0, 0, 0, 0, 0],
                                [1, 1, 1, 1, 1, 1, 1, 1],
                                [2, 3, 4, 6, 5, 4, 3, 2]]
}
