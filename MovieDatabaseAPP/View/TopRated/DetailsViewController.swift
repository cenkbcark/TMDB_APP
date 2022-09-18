//
//  DetailsViewController.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 17.09.2022.
//

import UIKit
import Kingfisher
import youtube_ios_player_helper

class DetailsViewController: UIViewController {
    //UI
    @IBOutlet weak var selectedVote: UILabel!
    @IBOutlet weak var selectedDate: UILabel!
    @IBOutlet weak var selectedOverview: UILabel!
    @IBOutlet weak var selectedTitle: UILabel!
    //SEGUE
    var selectedMovie : Movies?
    var selectedTv : TVs?
    var selectedChoice : String?
    var selectedMovieVideo : [MovieVideo]?
    var selectedTvVideo : [TvVideo]?
    var videoKey : String?
    var selectedID : Int?
    //PLAYER
    @IBOutlet weak var playerView: YTPlayerView!
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedID)
        checkData()
        if selectedChoice == "Movie"{
            getMovieVideo(dataID: selectedID!){ video in
                self.selectedMovieVideo = video
                if self.selectedChoice == "Movie"{
                    for video in video {
                        if video.site == .youTube{
                            if video.size == 1080{
                                if video.type == .trailer{
                                    self.videoKey = video.key
                                    print(self.videoKey as Any)
                                    self.playerView.load(withVideoId: self.videoKey!)
                                }
                            }
                        }
                    }
                }
            }
        }else{
            getTvVideo(dataID: selectedID!) { video in
                self.selectedTvVideo = video
                for video in video{
                    if video.site == "YouTube"{
                        if video.size == 1080 {
                            if video.type == "Trailer"{
                                self.videoKey = video.key
                                print(self.videoKey as Any)
                                self.playerView.load(withVideoId: self.videoKey!)
                            }
                        }
                    }
                }
            }
        }
        
        
        
        
        
    }
    func checkData(){
        switch selectedChoice{
        case "Movie":
            selectedVote.text = "Vote Average: \(selectedMovie?.vote_average ?? 0.0)"
            selectedDate.text = "Release Date: \(selectedMovie?.release_date ?? "Unkown")"
            selectedOverview.text = selectedMovie?.overview
            selectedTitle.text = selectedMovie?.title
        case "Tvs":
            selectedVote.text = "Vote Average: \(selectedTv?.vote_average ?? 0.0)"
            selectedDate.text = "Release Date: \(selectedTv?.first_air_date ?? "Unkown")"
            selectedOverview.text = selectedTv?.overview
            selectedTitle.text = selectedTv?.original_name
        default:
            print("no data incoming")
        }
    }
    
    private func getMovieVideo(dataID:Int,completion: @escaping (([MovieVideo]) -> ())){
        

        let url = "http://api.themoviedb.org/3/movie/\(dataID)/videos?api_key=87fd921402216fc7603c5c63d278f30c"
        
        VideoService.shared.fetchTopRatedMovieData(from: url) { response in
            
            guard let video = response.results else { return }
            completion(video)
        }
    }
    
    private func getTvVideo(dataID:Int,completion: @escaping (([TvVideo]) -> ())){
        

        let url = "http://api.themoviedb.org/3/tv/\(dataID)/videos?api_key=87fd921402216fc7603c5c63d278f30c"
        
        VideoService.shared.fetchTopRatedTvData(from: url) { response in
            
            guard let video = response.results else { return }
            
            completion(video)
        }
    }
    
    

}
