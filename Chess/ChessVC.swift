//
//  ViewController.swift
//  Chess
//
//  Created by Ivo on 12/12/16.
//  Copyright © 2016 Ivano Rotondo. All rights reserved.
//

import UIKit

class ChessVC : UIViewController {

    @IBOutlet var chessboardView: Chessboard!
    
    var chessEngine = ChessEngine()

    override func viewDidLoad() {
        
        chessboardView.chessEngine = chessEngine
        chessEngine.initCustomChessboard()
    }
}

