//
//  DetailViewController.swift
//  app5_adarsh_rao
//
//  Created by Adarsh Rao on 10/16/20.
//  Copyright © 2020 Adarsh Rao. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    var num: String?;
    var pi: UIImage?;
    var na: String?;
    var ema: String?;
    var comp: String?;
    
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var company: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        number.text = num;
        pic.image = pi;
        name.text = na;
        email.text = ema;
        company.text = comp;
    }
}
