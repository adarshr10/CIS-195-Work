//
//  ParkDetailViewController.swift
//  app6_adarsh_rao
//
//  Created by Adarsh Rao on 11/06/20.
//  Copyright © 2020 Adarsh Rao. All rights reserved.
//

import Foundation
import UIKit

class ParkDetailViewController: UIViewController {
    
    var name: String?;
    var pic: String?;
    var desig: String?;
    var descript: String?;
    
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var designation: UILabel!
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var image: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullName.text = name;
        let picture = URL(string: pic!);
        image.kf.setImage(with: picture);
        designation.text = desig;
        desc.text = descript;
    }
}
