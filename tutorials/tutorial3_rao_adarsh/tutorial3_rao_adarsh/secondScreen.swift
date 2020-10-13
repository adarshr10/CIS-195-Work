//
//  secondScreen.swift
//  tutorial3_rao_adarsh
//
//  Created by Adarsh Rao on 10/9/20.
//  Copyright © 2020 Adarsh Rao. All rights reserved.
//

import UIKit

class secondScreen: UIViewController {

    @IBOutlet weak var screenText: UITextField!
    
    var text = "";
    override func viewDidLoad() {
        super.viewDidLoad()
        screenText.text = text;
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
