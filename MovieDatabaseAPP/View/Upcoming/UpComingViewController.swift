//
//  UpComingViewController.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 17.09.2022.
//

import UIKit
import Kingfisher

class UpComingViewController: UIViewController {
    
    var upComingMovieList = [UpComingMovie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUpComingMovies { upComingMovie in
            self.upComingMovieList = upComingMovie
        }
        
    }
    
    private func getUpComingMovies(completion: @escaping (([UpComingMovie]) -> ())){
        
        let url = "https://api.themoviedb.org/3/movie/upcoming?api_key=87fd921402216fc7603c5c63d278f30c&language=en-US&page=1"
        
        upComingService.shared.fethUpComingMovie(from: url) { upComingMovie in
            guard let upMovies = upComingMovie.results else { return }
            completion(upMovies)
        }
    }
}
