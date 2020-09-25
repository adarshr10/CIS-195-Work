//
//  ViewController.swift
//  app0_rao_adarsh
//
//  Created by Adarsh Rao on 9/11/20.
//  Copyright © 2020 Adarsh Rao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.textColor = UIColor.blue
        myButton.setTitle("Turn Red", for: .normal)
    }
    @IBAction func changeButtonColor(_ sender: Any) {
        if (myButton.backgroundColor == UIColor.blue) {
            myButton.backgroundColor = UIColor.red
            label.textColor = UIColor.red
            myButton.setTitle("Turn Blue", for: .normal)
        } else {
            myButton.backgroundColor = UIColor.blue
            myButton.setTitle("Turn Red", for: .normal)
            label.textColor = UIColor.blue
        }
    }
    
    


}

