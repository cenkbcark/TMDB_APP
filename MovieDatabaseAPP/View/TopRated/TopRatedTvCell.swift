//
//  TopRatedTvCell.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 17.09.2022.
//

import UIKit

class TopRatedTvCell: UICollectionViewCell {
    
    @IBOutlet weak private var tvImage: UIImageView!
    
    func setTvs(from tvs: TVs){
        tvImage.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/original\(tvs.poster_path!)"))
    }
    
}
