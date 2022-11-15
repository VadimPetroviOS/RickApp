//
//  Parser.swift
//  RickApp
//
//  Created by Вадим on 15.11.2022.
//

import Foundation

struct Parser {
    
    func parse(comp : @escaping ([Result]) -> ()) {
        
        let api = URL(string: "https://rickandmortyapi.com/api/character")
        
        URLSession.shared.dataTask(with: api!) { data, responce, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            do {
                let result = try JSONDecoder().decode(Model.self, from: data!)
                comp(result.results)
            } catch {
                
            }
        }.resume()
    }
}
