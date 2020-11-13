//
//  ParkTableViewController.swift
//  app6_rao_adarsh
//
//  Created by Adarsh Rao on 11/4/20.
//  Copyright © 2020 Adarsh Rao. All rights reserved.
//

import UIKit
import Foundation
import Firebase
import Kingfisher

class ParkTableViewController: UITableViewController {

    var parks: [Park] = [Park]();
    let endpoint = "https://developer.nps.gov/api/v1/parks?limit=30&api_key=zS9LFf3PQNEK1kO40JHkleYlxuOECYLE8DdBsjB9";
    
    let db = Firestore.firestore();
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = UIRefreshControl();
        refreshControl?.addTarget(self, action:
        #selector(handleRefreshControl),
        for: .valueChanged)
        // Do any additional setup after loading the view.
        self.tableView.dataSource = self
    }
    
//    private func makeAPICall() {
//        let url = URL(string: endpoint)!;
//        let req = URLRequest(url: url);
//
//
//        let task = URLSession.shared.dataTask(with: req) { (data, response, error) in
//            guard let data = data, error == nil else {
//                print("Error");
//                return
//            }
//            if let APIRes = try? JSONDecoder().decode(APIData.self, from: data) {
//
//                DispatchQueue.main.async {
//                    self.parks = APIRes.data;
//                    for park in self.parks {
//                        var urls = [String]();
//                        for image in park.images {
//                            urls.append(image.url);
//                        }
//                        var ref: DocumentReference? = nil
//                        ref = self.db.collection("parks").addDocument(data: [
//                            "fullName": park.fullName,
//                            "description": park.description,
//                            "designation": park.designation,
//                            "images": urls
//                        ]) { err in
//                            if let err = err {
//                                print("Error adding document: \(err)")
//                            } else {
//                                print("Document added with ID: \(ref!.documentID)")
//                            }
//                        }
//                    }
//
//                    self.tableView.reloadData();
//                    print(self.parks);
//                }
//            }
//        }
//        task.resume();
//
//    }
    
    private func retrieveData() {
        DispatchQueue.main.async {
            self.db.collection("parks").getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data();
                        let urls = data["images"] as! [String];
                        let name = data["fullName"] as! String;
                        let desc = data["description"] as! String;
                        let desig = data["designation"] as! String;
                        var images = [Image]();
                        for url in urls {
                            images.append(Image(url: url));
                        }
                        let park = Park(fullName: name, description: desc, designation: desig, images: images);
                        self.parks.append(park);
                        
                    }
                }
                self.tableView.reloadData();
            }
        }
    }
    
    @objc func handleRefreshControl() {
        retrieveData();

       // Dismiss the refresh control.
       DispatchQueue.main.async {
          self.refreshControl?.endRefreshing()
       }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parks.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath);
        
        if let label = cell.viewWithTag(1) as? UILabel{
            label.text = "\(parks[indexPath.row].fullName)";
        }
        
        if let designation = cell.viewWithTag(2) as? UILabel{
            designation.text = parks[indexPath.row].designation
        }
        
        if let pic = cell.viewWithTag(3) as? UIImageView{
            var image: URL;
            if (parks[indexPath.row].images.count != 0) {
                image = URL(string: parks[indexPath.row].images[0].url)!;
            } else {
                image = URL(string: "https://www.nps.gov/common/uploads/banner_image/imr/homepage/99556161-1DD8-B71B-0B896E4D786C6B47.jpg")!;
            }
            

            pic.kf.setImage(with: image);
        }
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    // Handle segue
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ShowDetailsSegue", sender: parks[indexPath.row]);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier! == "ShowDetailsSegue" {
            if let s = segue.destination as? ParkDetailViewController {
                let parkInfo = sender as! Park
                print(parkInfo)
                s.name = parkInfo.fullName;
                if (parkInfo.images.count != 0) {
                    s.pic = parkInfo.images[0].url;
                } else {
                    s.pic = "https://www.nps.gov/common/uploads/banner_image/imr/homepage/99556161-1DD8-B71B-0B896E4D786C6B47.jpg";
                }
                s.desig = parkInfo.designation;
                s.descript = parkInfo.description;
            }
        }
    }
    



}

