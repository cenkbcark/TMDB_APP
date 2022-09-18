//
//  TRM_ViewModel.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 19.09.2022.
//

import Foundation

func getTopRatedMovies(completion: @escaping (([Movies]) -> ())){
    
    let url = "https://api.themoviedb.org/3/movie/top_rated?api_key=87fd921402216fc7603c5c63d278f30c&language=en-US&page=1"
    
    NetworkService.shared.fetchTopRatedMovieData(from: url) { response in
        guard let movies = response.results else {return}
        
        completion(movies)
    }
    
}

func setTopRatedMovies(from VC:TopRatedViewController){
    
    getTopRatedMovies { movies in
        VC.topRatedMovieList = movies
        VC.moviesCollectionView.reloadData()
    }
}
