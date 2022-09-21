//
//  TRC_ViewModel.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 21.09.2022.
//

import Foundation

func getMovieCast(dataID:Int,completion: @escaping (([Cast]) -> ())){
    
    
    let url = "https://api.themoviedb.org/3/movie/\(dataID)/credits?api_key=87fd921402216fc7603c5c63d278f30c&language=en-US"
    
    CastService.shared.fetchMovieCast(from: url) { movieCastModel in
        
        guard let response = movieCastModel.cast else {return}
        completion(response)
    }
}
func setMovieCast(dataID: Int, VC: DetailsViewController){
    
    getMovieCast(dataID: dataID) { movieCast in
        VC.movieCastList = movieCast
        VC.castCollectionView.reloadData()
    }
}
