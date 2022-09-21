//
//  TopRatedCell.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 17.09.2022.
//

import UIKit

class TopRatedCell: UICollectionViewCell {
    
    @IBOutlet weak private var topRatedImage: UIImageView!
    
    func setMovie(from movie: Movies){
        topRatedImage.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/original\(movie.poster_path!)"))
    }
    
    func configureCell(from cell: TopRatedCell){
        cell.layer.cornerRadius = 15.0
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.black.cgColor
    }
}
