//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Shushan Khachatryan on 4/16/19.
//  Copyright © 2019 Shushan Khachatryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet var btnArray: [UIButton]!
    var player = 1
    var gameIsActive = true
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinations = [[0, 1, 2], [3, 4, 5],[6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - Actions -
    
    @IBAction func action(_ sender: AnyObject) {
        
        if (gameState[sender.tag] == 0 && gameIsActive == true) {
            gameState[sender.tag] = player
            if (player == 1) {
                sender.setImage(UIImage(named: "cross.png"), for: UIControlState())
                player = 2
            } else {
                sender.setImage(UIImage(named: "nought.png"), for: UIControlState())
                player = 1
            }
        }
        
        for combination in winningCombinations {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                gameIsActive = false
                if gameState[combination[0]] == 1 {
                    label.text = "Cross has won!"
                } else {
                    label.text = "Nought has won!"
                }
                playAgainButton.isHidden = false
                label.isHidden = false
            }
        }
        
        if gameIsActive == true {
            var ifFull = true
            for i in gameState {
                if i == 0 {
                    ifFull = false
                    break
                }
            }
            if ifFull {
                label.text = "It was a draw!"
                label.isHidden = false
                playAgainButton.isHidden = false
            }
        }
    }
    
    
    @IBAction func playAgain(_ sender: AnyObject) {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        player = 1
        playAgainButton.isHidden = true
        label.isHidden = true
        for oneButton in self.btnArray {
            oneButton.setImage(nil, for: UIControlState())
        }
    }
}

