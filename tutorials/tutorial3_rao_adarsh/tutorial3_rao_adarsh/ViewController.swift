//
//  ViewController.swift
//  tutorial3_rao_adarsh
//
//  Created by Adarsh Rao on 10/9/20.
//  Copyright © 2020 Adarsh Rao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonNext: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationItem.title = nil
        if segue.identifier == "mySegue" {
            let s = segue.destination as UIViewController;
            s.view.backgroundColor = UIColor.red
           
        }
    }


}

