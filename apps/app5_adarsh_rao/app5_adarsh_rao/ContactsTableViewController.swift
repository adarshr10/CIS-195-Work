//
//  ContactsTableViewController.swift
//  app5_adarsh_rao
//
//  Created by Adarsh Rao on 10/16/20.
//  Copyright © 2020 Adarsh Rao. All rights reserved.
//

import Foundation
import UIKit

class ContactsTableViewController: UITableViewController, AddContactDelegate {
    
    
    var myContact: ContactItem = ContactItem(firstName: "Adarsh", lastName: "Rao", company: "Apple", email: "adarshr@seas.upenn.edu", number: "1234567890");
    var friendContact: ContactItem = ContactItem(firstName: "Jerry", lastName: "Ye", company: "Stealth-Startup", email: "jye@sas.upenn.edu", number: "0987654321");
    
    var selectedIndexPath: IndexPath?;
    
    var contacts: [ContactItem] = [ContactItem]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contacts.append(myContact);
        contacts.append(friendContact);
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    @IBAction func AddContactButton(_ sender: Any) {
        
    }
    
    func didCreate(_ contact: ContactItem) {
        print("called")
        dismiss(animated: true, completion: nil);
        contacts.append(contact);
        contacts.sort { (a:ContactItem, b:ContactItem) in
            return a.lastName.uppercased() < b.lastName.uppercased();
        }
        self.tableView.reloadData();
        
    }
    
    // MARK: - Basic table view methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath);
        
        if let label = cell.viewWithTag(2) as? UILabel{
            label.text = "\(contacts[indexPath.row].firstName) \(contacts[indexPath.row].lastName)";
        }
        
        if let subtitle = cell.viewWithTag(1) as? UILabel{
            subtitle.text = contacts[indexPath.row].company
        }
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
    // MARK: - Handle user interaction
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ShowDetailsSegue", sender: contacts[indexPath.row]);
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier! == "ShowDetailsSegue" {
            if let s = segue.destination as? DetailViewController {
                let contactInfo = sender as! ContactItem
                s.na = "\(contactInfo.firstName) \(contactInfo.lastName)";
                
                s.pi = contactInfo.picture ?? UIImage(systemName: "person.icloud");
                s.comp = contactInfo.company;
                s.num = contactInfo.number;
                s.ema = contactInfo.email;
            }
        }
        if segue.identifier! == "AddContactSegue" {
            if let s = segue.destination as? UINavigationController {
                let topView = s.topViewController as? AddContactViewController;
                topView!.delegate = self;
            }
        }
    }
    
    
    // MARK: - Swipe to delete functionality
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contacts.remove(at: indexPath.row);
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }

}
