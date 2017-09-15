//
//  MovieTableViewCell.swift
//  Cynimatics
//
//  Created by Mushaheed Kapadia on 9/14/17.
//  Copyright © 2017 Mushaheed Kapadia. All rights reserved.
//

import UIKit
import AFNetworking

class MovieTableViewCell: UITableViewCell {
    
    var movie: Movie!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!

    func from(_ movie: Movie) -> Void {
        self.movie = movie
        titleLabel.text! = movie.title
        overviewLabel.text! = movie.overview
        
        let moviePosterRequest: URLRequest = URLRequest(url: movie.posterPath)
        moviePosterImageView.setImageWith(moviePosterRequest, placeholderImage: nil, success: { (moviePosterRequest, moviePosterResponse, moviePoster) in
            if moviePosterResponse != nil {
                self.moviePosterImageView.alpha = 0.0
                self.moviePosterImageView.image = moviePoster
                
                UIView.animate(withDuration: 0.3, animations: { 
                    self.moviePosterImageView.alpha = 1.0
                })
            }
        }) { (moviePosterRequst, moviePosterResponse, error) in
            print(error)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
