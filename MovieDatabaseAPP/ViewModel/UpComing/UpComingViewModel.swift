//
//  UpComingViewModel.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 19.09.2022.
//

import Foundation

func getUpComingMovies(completion: @escaping (([UpComingMovie]) -> ())){
    
    let url = ""
    
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
