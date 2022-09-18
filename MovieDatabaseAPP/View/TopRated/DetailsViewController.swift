//
//  DetailsViewController.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 17.09.2022.
//

import UIKit
import Kingfisher
import youtube_ios_player_helper

final class DetailsViewController: UIViewController {
    //UI
    @IBOutlet weak private var selectedVote: UILabel!
    @IBOutlet weak private var selectedDate: UILabel!
    @IBOutlet weak private var selectedOverview: UILabel!
    @IBOutlet weak private var selectedTitle: UILabel!
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
        
        checkData()
        if selectedChoice == "Movie"{
            setMovieVideo(dataID: selectedID!, VC: self)
        }else{
            setTvVideo(dataID: selectedID!, VC: self)
        }
        
    }
    private func checkData(){
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
}
