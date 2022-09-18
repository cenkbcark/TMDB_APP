//
//  TRT_ViewModel.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 19.09.2022.
//

import Foundation

func getTopRatedTVs(completion: @escaping (([TVs]) -> ())){
    
    let url = "https://api.themoviedb.org/3/tv/top_rated?api_key=87fd921402216fc7603c5c63d278f30c&language=en-US&page=1"
    
    NetworkService.shared.fetchTopRatedTvData(from: url) { response in
        guard let tvs = response.results else {return}
        
        completion(tvs)
    }
    
}

func setTopRatedTvs(from VC: TopRatedViewController){
    
    getTopRatedTVs { tvs in
        VC.topRatedTVList = tvs
        VC.tvsCollectionView.reloadData()
    }
}
