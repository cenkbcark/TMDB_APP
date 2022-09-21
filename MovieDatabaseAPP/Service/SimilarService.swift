//
//  SimilarService.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 21.09.2022.
//

import Foundation

class SimilarService {
    
    static let shared = SimilarService()
    
    func fethUpSimilarMovie(from url: String, completion: @escaping (SimilarMovieModel) -> ()) {
        
        if let url = URL(string: url){
            
            URLSession.shared.dataTask(with: url){data, response, error in
                
                guard let data = data else {return}
                
                do{
                    let response = try JSONDecoder().decode(SimilarMovieModel.self, from: data)
                    DispatchQueue.main.async {
                        completion(response)
                    }
                    
                }catch{
                    print("catch error\(error.localizedDescription)")
                }
            }.resume()
        }else{
            print("no data")
        }
    }
    
}
