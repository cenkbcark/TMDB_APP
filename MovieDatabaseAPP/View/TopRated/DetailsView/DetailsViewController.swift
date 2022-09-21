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
    //CollectionViews
    @IBOutlet weak var similarCollectionView: UICollectionView!
    @IBOutlet weak var castCollectionView: UICollectionView!
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
    var similarMovieList = [SimilarMovie]()
    var movieCastList = [Cast]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkData()
        if selectedChoice == "Movie"{
            setMovieVideo(dataID: selectedID!, VC: self)
            setSimilarMovie(dataID: selectedID!, from: self)
            setMovieCast(dataID: selectedID!, VC: self)
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

extension DetailsViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case similarCollectionView:
            return similarMovieList.count
        case castCollectionView:
            return movieCastList.count
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case similarCollectionView:
            if let cell = similarCollectionView.dequeueReusableCell(withReuseIdentifier: "similarCell", for: indexPath) as? SimilarCell{
                cell.configureCell(from: cell)
                cell.setSimilarCell(from: similarMovieList[indexPath.row])
                return cell
            }
            return  UICollectionViewCell()
        case castCollectionView:
            if let cell = castCollectionView.dequeueReusableCell(withReuseIdentifier: "castCell", for: indexPath) as? CastCell{
                cell.configureCell(from: cell)
                cell.setCastCell(from: movieCastList[indexPath.row])
                return cell
            }
            return UICollectionViewCell()
        default:
            return UICollectionViewCell()
        }
    }
}
