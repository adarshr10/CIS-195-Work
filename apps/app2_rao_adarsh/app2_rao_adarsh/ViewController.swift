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
    
    @IBOutlet weak var p2Score: UILabel!
    
    @IBOutlet weak var gameState: UILabel!
    
    @IBOutlet lazy var collectionOfButtons: Array<UIButton> = [UIButton]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    


    @IBAction func btnClick(_ sender: UIButton) {
        let image = Bool.random();
        if image {
            sender.setImage(UIImage(named: "mark-x"), for: .normal);
            mainTitle.text = "Jerry";
            p1Score.text = "Ye";
            p2Score.text = "Is";
            gameState.text = "Awesome";
        } else {
            sender.setImage(UIImage(named: "mark-o"), for: .normal);
            mainTitle.text = "Adarsh";
            p1Score.text = "Rao";
            p2Score.text = "Takes";
            gameState.text = "CIS 195";
        }
        print(sender.tag);
            
    }
    
    @IBAction func clearBoard(_ sender: UIButton) {
        for b in collectionOfButtons {
             b.setImage(UIImage(named: "mark-none"), for: .normal);
        }
    }
}

