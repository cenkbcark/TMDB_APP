//
//  DetailsTVsViewModel.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 19.09.2022.
//

import Foundation

func getTvVideo(dataID:Int,completion: @escaping (([TvVideo]) -> ())){
    

    let url = ""
    
    VideoService.shared.fetchTopRatedTvData(from: url) { response in
        
        guard let video = response.results else { return }
        
        completion(video)
    }
}

func setTvVideo(dataID:Int,VC: DetailsViewController){
    
    getTvVideo(dataID: dataID) { tvVideo in
        VC.selectedTvVideo = tvVideo
        getTrailerTvs(video: tvVideo, VC: VC)
        
    }
}

func getTrailerTvs(video : [TvVideo],VC:DetailsViewController){
    
    for video in video {
        if video.site == "YouTube" {
            if video.size == 1080 {
                if video.type == "Trailer" {
                    VC.videoKey = video.key
                    VC.playerView.load(withVideoId: VC.videoKey!)
                }
            }
        }
    }
    
}
