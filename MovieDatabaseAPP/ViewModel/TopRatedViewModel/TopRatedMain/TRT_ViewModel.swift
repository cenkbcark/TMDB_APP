//
//  TRT_ViewModel.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 19.09.2022.
//

import Foundation

func getTopRatedTVs(completion: @escaping (([TVs]) -> ())){
    
    let url = ""
    
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
