//
//  UpComingMovieCell.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 19.09.2022.
//

import UIKit

class UpComingMovieCell: UICollectionViewCell {
    
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    func setUpComing(from upComingMovie: UpComingMovie){
        
        releaseDate.text = upComingMovie.release_date
        movieTitle.text = upComingMovie.title
        movieImage.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/original/\(upComingMovie.poster_path!)"))
        movieImage.layer.cornerRadius = 25.0
    }
}
