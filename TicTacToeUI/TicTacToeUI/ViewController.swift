//
//  ViewController.swift
//  TicTacToeUI
//
//  Created by TJ Usiyan on 2017/01/04.
//  Copyright © 2017 Buttons and Lights LLC. All rights reserved.
//

import UIKit
import TicTacToeCore

class ViewController: UIViewController {

    var board: Cell = Cell()

    @IBOutlet var upperLeft: UIButton!
    @IBOutlet var upperMiddle: UIButton!
    @IBOutlet var upperRight: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
    
        updateBoardDisplay()
    }

    func updateBoardDisplay() {
        upperLeft.setTitle(String(describing: board[0, 0]), for: .normal)
        upperMiddle.setTitle(String(describing: board[0, 1]), for: .normal)
        upperRight.setTitle(String(describing: board[0, 2]), for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func selectSpot(_ sender: UIButton) {
        if let newBoard =  board.place(marker: .o, index: sender.tag) {
            board = newBoard
            updateBoardDisplay()
        }
    }
    
    
}

