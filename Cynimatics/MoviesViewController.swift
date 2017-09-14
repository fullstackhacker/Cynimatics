//
//  MoviesViewController.swift
//  Cynimatics
//
//  Created by Mushaheed Kapadia on 9/14/17.
//  Copyright © 2017 Mushaheed Kapadia. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var moviesTableView: UITableView!
    
    var movies: [Movie] = []
    
    func fetchNowPlayingMovies(next: @escaping (([Movie]) -> Void)) {
        let apiKey: String = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
        let url: URL = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")!
        let request: URLRequest = URLRequest(url: url)
        let session: URLSession = URLSession(
            configuration: URLSessionConfiguration.default,
            delegate: nil,
            delegateQueue: OperationQueue.main
        )
        
        let task: URLSessionDataTask = session.dataTask(with: request) { (data, response, err) in
            if let data = data {
                if let responseDict = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                    if let moviesList = responseDict["results"] as? [NSDictionary] {
                        let movies = moviesList.map({ (movieDict) -> Movie in
                            return Movie(from: movieDict)
                        })
                        next(movies)
                    }
                }
                
            }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesTableView.dataSource = self
        moviesTableView.delegate = self

        fetchNowPlayingMovies { (movies) in
            self.movies = movies
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(
            withIdentifier: "MovieCell",
            for: indexPath
        )
        cell.textLabel!.text = "row\(indexPath.row)"
        return cell
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