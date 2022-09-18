//
//  VideoService.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 17.09.2022.
//

import Foundation

class VideoService{
    
    static let shared = VideoService()
    
    func fetchTopRatedMovieData(from url: String, completion: @escaping (MovieVideoModel) -> ()) {
        
        if let url = URL(string: url){
            
            URLSession.shared.dataTask(with: url){data, response, error in
                
                guard let data = data else {return}
                
                do{
                    let response = try JSONDecoder().decode(MovieVideoModel.self, from: data)
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
    func fetchTopRatedTvData(from url: String, completion: @escaping (TvVideoModel) -> ()) {
        
        if let url = URL(string: url){
            
            URLSession.shared.dataTask(with: url){data, response, error in
                
                guard let data = data else {return}
                
                do{
                    let response = try JSONDecoder().decode(TvVideoModel.self, from: data)
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
