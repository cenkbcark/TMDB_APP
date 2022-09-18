//
//  NetworkService.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 17.09.2022.
//

import Foundation


class NetworkService {
    
    static let shared = NetworkService()
    
    func fetchTopRatedMovieData(from url: String, completion: @escaping (TopRatedMovieModel) -> ()) {
        
        if let url = URL(string: url){
            
            URLSession.shared.dataTask(with: url){data, response, error in
                
                guard let data = data else {return}
                
                do{
                    let response = try JSONDecoder().decode(TopRatedMovieModel.self, from: data)
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
    
    func fetchTopRatedTvData(from url: String, completion: @escaping (TopRatedTvModel) -> ()) {
        
        if let url = URL(string: url){
            
            URLSession.shared.dataTask(with: url){data, response, error in
                
                guard let data = data else {return}
                
                do{
                    let response = try JSONDecoder().decode(TopRatedTvModel.self, from: data)
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
