//
//  UpcomingService.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 19.09.2022.
//

import Foundation


class upComingService{
    
    static let shared = upComingService()
    
    func fethUpComingMovie(from url: String, completion: @escaping (UpComingMovieModel) -> ()) {
        
        if let url = URL(string: url){
            
            URLSession.shared.dataTask(with: url){data, response, error in
                
                guard let data = data else {return}
                
                do{
                    let response = try JSONDecoder().decode(UpComingMovieModel.self, from: data)
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
