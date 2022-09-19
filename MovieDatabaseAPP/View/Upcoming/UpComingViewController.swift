//
//  UpComingViewController.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 17.09.2022.
//

import UIKit
import Kingfisher

final class UpComingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var upComingMovieList = [UpComingMovie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpComingMovies(VC: self)
        
    }
}
extension UpComingViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return upComingMovieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upComingCell", for: indexPath) as? UpComingMovieCell{
            let movie = upComingMovieList[indexPath.row]
            cell.setUpComing(from: movie)
            return cell
        }
        return UICollectionViewCell()
    }
}
