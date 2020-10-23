//
//  AddContactViewController.swift
//  app5_adarsh_rao
//
//  Created by Adarsh Rao on 10/16/20.
//  Copyright © 2020 Adarsh Rao. All rights reserved.
//

import Foundation
import UIKit

protocol AddContactDelegate: class {
    func didCreate(_ contact: ContactItem)
}

class AddContactViewController: UIViewController {
    
    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var lastField: UITextField!
    @IBOutlet weak var companyField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    
    weak var delegate: AddContactDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    func createNewContact() -> ContactItem? {
        var toAdd : ContactItem?;
        if (firstField != nil && lastField != nil && companyField != nil && emailField != nil && numberField != nil) {
            toAdd = ContactItem(firstName: firstField!.text!, lastName: lastField!.text!, company: companyField!.text!, email: emailField!.text!, number: numberField!.text!);
        }
        return toAdd;
    }
    
    @IBAction func CancelAdd(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func SaveAdd(_ sender: Any) {
        if let contact = createNewContact() {
            self.delegate?.didCreate(contact);            
        }
    }
    
}
