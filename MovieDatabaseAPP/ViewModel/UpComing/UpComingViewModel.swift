//
//  UpComingViewModel.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 19.09.2022.
//

import Foundation

func getUpComingMovies(completion: @escaping (([UpComingMovie]) -> ())){
    
    let url = "https://api.themoviedb.org/3/movie/upcoming?api_key=87fd921402216fc7603c5c63d278f30c&language=en-US&page=1"
    
    upComingService.shared.fethUpComingMovie(from: url) { upComingMovie in
        guard let upMovies = upComingMovie.results else { return }
        completion(upMovies)
    }
}

func setUpComingMovies(VC:UpComingViewController){
    
    getUpComingMovies { upComingMovies in
        VC.upComingMovieList = upComingMovies
        VC.collectionView.reloadData()
    }
}
