//
//  Movie.swift
//  Cynimatics
//
//  Created by Mushaheed Kapadia on 9/14/17.
//  Copyright © 2017 Mushaheed Kapadia. All rights reserved.
//

import Foundation

class Movie {
    let posterBaseUrl: String = "https://image.tmdb.org/t/p/w342"
    
    var id: Int
    var title: String
    var overview: String
    var posterPath: URL
    
    init(from: NSDictionary){
        id = from["id"] as! Int
        title = from["title"] as! String
        overview = from["overview"] as! String
        posterPath = URL(string: "\(posterBaseUrl)\(from["poster_path"] as! String)" )!
    }
}
