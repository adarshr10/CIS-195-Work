//
//  ParkData.swift
//  app6_rao_adarsh
//
//  Created by Adarsh Rao on 11/4/20.
//  Copyright © 2020 Adarsh Rao. All rights reserved.
//

import Foundation

struct APIData: Codable {
    let data: [Park];
}

struct Park: Codable {
    let fullName: String;
    let description: String;
    let designation: String;
    let images: [Image]
}

struct Image: Codable {
    let url: String
}
