//
//  TRM_ViewModel.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 19.09.2022.
//

import Foundation

func getTopRatedMovies(completion: @escaping (([Movies]) -> ())){
    
    let url = ""
    
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
