//
//  ViewController.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 17.09.2022.
//......

import UIKit
import Kingfisher

final class TopRatedViewController: UIViewController {
    
    @IBOutlet weak var topRatedImage: UIImageView!
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    @IBOutlet weak var tvsCollectionView: UICollectionView!
    
    var topRatedMovieList = [Movies]()
    var topRatedTVList = [TVs]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTopRatedMovies(from: self)
        setTopRatedTvs(from: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "forMovie" {
            let movie = sender as? Movies
            if let destination = segue.destination as? DetailsViewController {
                destination.selectedMovie = movie
                destination.selectedChoice = "Movie"
                destination.selectedID = movie?.id
            }
        }
        if segue.identifier == "forTv" {
            let tv = sender as? TVs
            if let destination = segue.destination as? DetailsViewController {
                destination.selectedTv = tv
                destination.selectedChoice = "Tvs"
                destination.selectedID = tv?.id
            }
        }
    }
    


}
extension TopRatedViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case tvsCollectionView:
            return topRatedTVList.count
        case moviesCollectionView:
            return topRatedMovieList.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView{
        case moviesCollectionView:
            let movie = topRatedMovieList[indexPath.row]
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moviesCell", for: indexPath) as? TopRatedCell{
                cell.configureCell(from: cell)
                cell.setMovie(from: movie)
                return cell
            }
            return UICollectionViewCell()
        case tvsCollectionView:
            let tvs = topRatedTVList[indexPath.row]
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tvsCell", for: indexPath) as? TopRatedTvCell{
                cell.configureCell(from: cell)
                cell.setTvs(from: tvs)
                return cell
            }
            return UICollectionViewCell()
        default:
            return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView {
        case moviesCollectionView:
            return performSegue(withIdentifier: "forMovie", sender: topRatedMovieList[indexPath.row])
        case tvsCollectionView:
            return performSegue(withIdentifier: "forTv", sender: topRatedTVList[indexPath.row])
        default:
            print("segue can not be performing")
        }
    }
}

