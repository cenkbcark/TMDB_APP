//
//  DetailsMovieViewModel.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 19.09.2022.
//

import Foundation

func getMovieVideo(dataID:Int,completion: @escaping (([MovieVideo]) -> ())){
    

    let url = "http://api.themoviedb.org/3/movie/\(dataID)/videos?api_key=87fd921402216fc7603c5c63d278f30c"
    
    VideoService.shared.fetchTopRatedMovieData(from: url) { response in
        
        guard let video = response.results else { return }
        completion(video)
    }
}

func setMovieVideo(dataID: Int,VC:DetailsViewController){
    
    getMovieVideo(dataID: dataID) { movieVideo in
        VC.selectedMovieVideo = movieVideo
        getTrailerMovie(video: movieVideo, VC: VC)
        
    }
}

func getTrailerMovie(video: [MovieVideo], VC:DetailsViewController){
    
    for video in video{
        if video.site == .youTube {
            if video.size == 1080 {
                if video.type == .trailer {
                    VC.videoKey = video.key
                    VC.playerView.load(withVideoId: VC.videoKey!)
                }
            }
        }
    }
    
}
