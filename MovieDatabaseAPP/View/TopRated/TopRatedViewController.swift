//
//  ViewController.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 17.09.2022.
//

import UIKit
import Kingfisher

class TopRatedViewController: UIViewController {
    
    @IBOutlet weak var topRatedImage: UIImageView!
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    @IBOutlet weak var tvsCollectionView: UICollectionView!
    
    var topRatedMovieList = [Movies]()
    var topRatedTVList = [TVs]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        getTopRatedMovies { movies in
            self.topRatedMovieList = movies
            self.moviesCollectionView.reloadData()
        }
        getTopRatedTVs { series in
            self.topRatedTVList = series
            self.tvsCollectionView.reloadData()
        }
    }
    
    
    
    
    private func getTopRatedMovies(completion: @escaping (([Movies]) -> ())){
        
        let url = "https://api.themoviedb.org/3/movie/top_rated?api_key=87fd921402216fc7603c5c63d278f30c&language=en-US&page=1"
        
        NetworkService.shared.fetchTopRatedMovieData(from: url) { response in
            guard let movies = response.results else {return}
            
            completion(movies)
        }
        
    }
    private func getTopRatedTVs(completion: @escaping (([TVs]) -> ())){
        
        let url = "https://api.themoviedb.org/3/tv/top_rated?api_key=87fd921402216fc7603c5c63d278f30c&language=en-US&page=1"
        
        NetworkService.shared.fetchTopRatedTvData(from: url) { response in
            guard let tvs = response.results else {return}
            
            completion(tvs)
        }
        
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moviesCell", for: indexPath) as! TopRatedCell
            cell.topRatedImage.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/original\(movie.poster_path!)"))
            return cell
        case tvsCollectionView:
            let tvs = topRatedTVList[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tvsCell", for: indexPath) as! TopRatedTvCell
            cell.tvImage.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/original\(tvs.poster_path!)"))
            return cell
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

