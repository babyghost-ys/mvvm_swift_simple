//
//  APIHandler.swift
//  mvvm_swift
//
//  Created by Peter Leung on 12/01/2023.
//

import Foundation

class APIHandler {
    private let sourcesURL = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    
    func getDataFromAPI(completion : @escaping ([Post]) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                do {
                    let posts = try jsonDecoder.decode([Post].self, from: data)
                    completion(posts)
                } catch let err {
                    print("Error on parsing \(err)")
                }
                
            }
        }.resume()
    }
}
