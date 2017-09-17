//
//  MovieViewController.swift
//  Cynimatics
//
//  Created by Mushaheed Kapadia on 9/14/17.
//  Copyright © 2017 Mushaheed Kapadia. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview

        let lowResolutionPosterRequest: URLRequest = URLRequest(url: movie.lowResolutionPosterPath)

        posterImageView.setImageWith(
            lowResolutionPosterRequest,
            placeholderImage: nil,
            success: { (lowResolutionPosterRequest, lowResolutionPosterResponse, lowResolutionPoster) in
                if lowResolutionPosterResponse != nil {
                    self.posterImageView.alpha = 0.0
                    self.posterImageView.image = lowResolutionPoster

                    UIView.animate(withDuration: 0.3, animations: {
                        self.posterImageView.alpha = 1.0
                    }, completion: { (success) -> Void in
                        self.fetchAndSetHighResolutionPoster(lowResolutionPoster: lowResolutionPoster)})
                }
                else {
                    self.posterImageView.image = lowResolutionPoster
                    self.fetchAndSetHighResolutionPoster(lowResolutionPoster: lowResolutionPoster)
                }
        }) { (errorRequest, errorResponse, error) in
            print(error)
        }
        
        // Do any additional setup after loading the view.
    }
    
    func fetchAndSetHighResolutionPoster (lowResolutionPoster: UIImage) -> Void {
        
        let highResolutionPosterRequest: URLRequest = URLRequest(url: movie.highResolutionPosterPath)

        self.posterImageView.setImageWith(
            highResolutionPosterRequest,
            placeholderImage: lowResolutionPoster,
            success: { (highResolutionPosterRequest, highResolutionPosterResponse, highResolutionPoster) in
                self.posterImageView.image = highResolutionPoster
        }, failure: { (errorRequest, errorResponse, error) in
            print(error)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
