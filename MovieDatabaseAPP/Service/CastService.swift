//
//  CastService.swift
//  MovieDatabaseAPP
//
//  Created by Cenk Bahadır Çark on 21.09.2022.
//

import Foundation

class CastService{
    
    static let shared = CastService()
    
    func fetchMovieCast(from url: String, completion: @escaping (MovieCastModel) -> ()){
        
        if let url = URL(string: url){
            
            URLSession.shared.dataTask(with: url){data, response ,error in
                
                guard let data = data else {return}
                do{
                    let response = try JSONDecoder().decode(MovieCastModel.self, from: data)
                    DispatchQueue.main.async {
                        completion(response)
                    }
                }catch{
                    print("error\(error.localizedDescription)")
                }
            }.resume()
        }else{
            print("invalid URL")
        }
    }
    
    
}
