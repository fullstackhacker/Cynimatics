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
    let lowResolutionPosterBaseUrl: String = "https://image.tmdb.org/t/p/w45"
    let highResolutionPosterBaseUrl: String = "https://image.tmdb.org/t/p/original"
    
    var id: Int
    var title: String
    var overview: String
    var posterPath: URL
    var lowResolutionPosterPath: URL
    var highResolutionPosterPath: URL
    
    init(from: NSDictionary){
        id = from["id"] as! Int
        title = from["title"] as! String
        overview = from["overview"] as! String
        posterPath = URL(string: "\(posterBaseUrl)\(from["poster_path"] as! String)" )!
        lowResolutionPosterPath = URL(string: "\(lowResolutionPosterBaseUrl)\(from["poster_path"] as! String)" )!
        highResolutionPosterPath = URL(string: "\(highResolutionPosterBaseUrl)\(from["poster_path"] as! String)" )!
    }
}
