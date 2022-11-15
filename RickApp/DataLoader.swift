//
//  DataLoader.swift
//  RickApp
//
//  Created by Вадим on 15.11.2022.
//

import Foundation

public class DataLoader {
    
    var userData = Model(results: [])
    
        
    init() {
        fetchingAPIData(URL: "https://rickandmortyapi.com/api/character") { result in
            print(result)
        }
        print(userData)
    }
    
    func fetchingAPIData(URL url: String, completion: @escaping (Model) -> Void) {
        
        let url = URL(string: url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, responce, error in
            do {
                let parsingData = try JSONDecoder().decode(Model.self, from: data!)
                DispatchQueue.main.async {
                    completion(parsingData)
                    self.userData = parsingData
                }
               
            } catch {
                print("Parsing Error")
                print(error)
            }
            
            
        }
        dataTask.resume()
    }
}

