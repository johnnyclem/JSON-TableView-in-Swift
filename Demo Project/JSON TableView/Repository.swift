//
//  Repository.swift
//  JSON TableView
//
//  Created by John Clem on 3/4/15.
//  Copyright (c) 2015 Learn Swift. All rights reserved.
//

import UIKit

class Repository {
    
    var name: String?
    var description: String?
    var html_url: String?
    
    init(json: NSDictionary) {
        self.name = json["name"] as? String
        self.description = json["description"] as? String
        self.html_url = json["html_url"] as? String
    }
}