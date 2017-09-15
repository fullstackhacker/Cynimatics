//
//  MovieTableViewCell.swift
//  Cynimatics
//
//  Created by Mushaheed Kapadia on 9/14/17.
//  Copyright © 2017 Mushaheed Kapadia. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    
    func from(_ movie: Movie) -> Void {
        titleLabel.text! = movie.title
        overviewLabel.text! = movie.overview
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
