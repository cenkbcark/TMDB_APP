//
//  CastCell.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 21.09.2022.
//

import UIKit

class CastCell: UICollectionViewCell {
    
    @IBOutlet weak var castImage: UIImageView!
    @IBOutlet weak var castName: UILabel!
    @IBOutlet weak var castCharacter: UILabel!
    @IBOutlet weak var castType: UILabel!
    
    func setCastCell(from cast: Cast){
        castName.text = cast.name
        castCharacter.text = cast.character
        castType.text = cast.known_for_department?.rawValue
        castImage.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/original\(cast.profile_path!)"))
    }
    func configureCell(from cell: CastCell){
        cell.layer.cornerRadius = 15.0
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.black.cgColor
    }
}
