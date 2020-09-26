//
//  ViewController.swift
//  app2_rao_adarsh
//
//  Created by Adarsh Rao on 9/18/20.
//  Copyright © 2020 Adarsh Rao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // top row
    @IBOutlet weak var TL: UIButton!
    @IBOutlet weak var TM: UIButton!
    @IBOutlet weak var TR: UIButton!
    // middle row
    @IBOutlet weak var ML: UIButton!
    @IBOutlet weak var MM: UIButton!
    @IBOutlet weak var MR: UIButton!
    //bottom row
    @IBOutlet weak var BL: UIButton!
    @IBOutlet weak var BM: UIButton!
    @IBOutlet weak var BR: UIButton!
    
    @IBOutlet weak var mainTitle: UILabel!
    
    @IBOutlet weak var p1Score: UILabel!
    var one = 0;
    var two = 0;
    
    @IBOutlet weak var p2Score: UILabel!
    
    @IBOutlet weak var gameState: UILabel!
    
    @IBOutlet lazy var collectionOfButtons: Array<UIButton> = [UIButton]();
    
    var winningCombos: [[Int]] = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [2, 4, 6], [0, 4, 8]]
    
    var gameTracker: [Int] = [0,0,0,0,0,0,0,0,0];
    
    var p1: Bool = false;
    var p2: Bool = false;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        p1 = true;
        gameState.text = "Player 1's Turn";
        
        p1Score.text = p1Score.text! + String(one);
        p2Score.text = p2Score.text! + String(two);
    }
    


    @IBAction func btnClick(_ sender: UIButton) {
        if p1 {
            if sender.isEnabled == true {
                let buttonImage = UIImage(named: "mark-x")?.withRenderingMode(.alwaysTemplate)
                sender.setImage(buttonImage, for: .normal);
                p1 = false;
                p2 = true;
                gameState.text = "Player 2's Turn";
                sender.isEnabled = false;
                gameTracker[sender.tag - 1] = 1;
            } else {
                print("Send an alert")
            }
            
        } else {
            if sender.isEnabled == true {
                let buttonImage = UIImage(named: "mark-o")?.withRenderingMode(.alwaysTemplate)
                sender.setImage(buttonImage, for: .normal);
                gameState.text = "Player 1's Turn";
                p1 = true;
                p2 = false;
                sender.isEnabled = false;
                gameTracker[sender.tag - 1] = -1;
            } else {
                print("send an alert");
            }
            
        }
        var draw: Bool = true;
        
        for b in collectionOfButtons {
            if b.isEnabled {
                draw = false
            }
        }
        if draw {
            gameState.text = "Draw!";
            gameEnd();
            for b in collectionOfButtons {
                b.tintColor = .systemGray;
            }
        }
        else {
            for combo in winningCombos {
                if gameTracker[combo[0]] != 0 && gameTracker[combo[0]] == gameTracker[combo[1]] && gameTracker[combo[1]] == gameTracker[combo[2]] {
                    for i in combo {
                        for b in collectionOfButtons {
                            if b.tag - 1 == i {
                                b.tintColor = .systemYellow;
                            }
                            b.isEnabled = false;
                        }
                    }
                    gameState.textColor = UIColor.green;
                    if gameTracker[combo[0]] == -1 {
                        gameState.text = "Player 2 Wins";
                        two+=1;
                    } else {
                        gameState.text = "Player 1 Wins";
                        one+=1;
                    }
                    p1Score.text = "Player 1 Score: " + String(one);
                    p2Score.text = "Player 2 Score: " + String(two);
                    gameEnd();
                }
            }
        }
        
    }
    
    @IBAction func clearBoard(_ sender: UIButton) {
        gameState.textColor = UIColor.black;
        gameState.text = "Player 1's Turn";
        p1 = true;
        p2 = false;
        for b in collectionOfButtons {
            let buttonImage = UIImage(named: "mark-none")?.withRenderingMode(.alwaysTemplate)
             b.setImage(buttonImage, for: .normal);
             b.isEnabled = true;
             b.tintColor = .systemBlue;
        }
        for i in 0..<gameTracker.count {
            gameTracker[i] = 0;
        }
    }
    func gameEnd() {
        for b in collectionOfButtons {
             b.isEnabled = false;
        }
        for i in 0..<gameTracker.count {
            gameTracker[i] = 0;
        }
    }
}

