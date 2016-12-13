//
//  Chessboard.swift
//  Chess
//
//  Created by Ivo on 12/12/16.
//  Copyright © 2016 Ivano Rotondo. All rights reserved.
//

import UIKit

@IBDesignable
class Chessboard: UIView {
    
    @IBInspectable var fillColor: UIColor = UIColor.greenColor()
    
    
    override func drawRect(rect: CGRect) {
        
        let squareLength = bounds.width/8
        
//        drawLines(squareLength)
        drawSquares(squareLength)
    }
    
    
    private func drawSquares(squareLength: CGFloat) {
        func isEven(number: Int) -> Bool {
            if number % 2 != 0 {
                return true
            } else {
                return false
            }
        }
        
        for row in 1...8 {
            for col in 1...8{
                if (isEven(row) && isEven(col)) || (!isEven(row) && !isEven(col)) {
                    let x = (CGFloat(8 - row)) * squareLength
                    let y = (CGFloat(col - 1)) * squareLength
                    let square = CGRect(x: x, y: y, width: squareLength, height: squareLength)
                    var squareBP:UIBezierPath = UIBezierPath(rect: square)
                    
                    UIColor.blackColor().setStroke()
                    squareBP.fill()
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
}
