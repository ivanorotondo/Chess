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
    
    var chess = Chess()

    override func viewDidLoad() {
        
        chessboardView.chess = chess
        chess.initialSetUp()
    }
}

