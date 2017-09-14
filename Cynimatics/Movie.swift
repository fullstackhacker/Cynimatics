//
//  Movie.swift
//  Cynimatics
//
//  Created by Mushaheed Kapadia on 9/14/17.
//  Copyright © 2017 Mushaheed Kapadia. All rights reserved.
//

import Foundation

class Movie {
    var id: Int
    var title: String
    
    init(from: NSDictionary){
        id = from["id"] as! Int
        title = from["title"] as! String
    }
}
