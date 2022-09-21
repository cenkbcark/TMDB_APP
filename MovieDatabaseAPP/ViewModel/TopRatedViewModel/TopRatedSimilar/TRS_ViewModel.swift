//
//  TRS_ViewModel.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 21.09.2022.
//

import Foundation

func getSimilarMovie(dataID:Int,completion: @escaping (([SimilarMovie]) -> ())){
    

    let url = "https://api.themoviedb.org/3/movie/\(dataID)/similar?api_key=87fd921402216fc7603c5c63d278f30c&language=en-US&page=1"
    
    SimilarService.shared.fethUpSimilarMovie(from: url) { response in
        
        guard let response = response.results else { return }
        completion(response)
    }
}

func setSimilarMovie(dataID:Int,from vc : DetailsViewController){
    
    getSimilarMovie(dataID: dataID) { similarMovies in
        vc.similarMovieList = similarMovies
        vc.similarCollectionView.reloadData()
    }
}


