//
//  SimilarCell.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 21.09.2022.
//

import UIKit

class SimilarCell: UICollectionViewCell {
    
    @IBOutlet weak var similarImage: UIImageView!
    
    func setSimilarCell(from similarMovie: SimilarMovie){
        similarImage.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/original\(similarMovie.poster_path!)"))
    }
    
    func configureCell(from cell: SimilarCell){
        cell.layer.cornerRadius = 15.0
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.black.cgColor
    }
}
