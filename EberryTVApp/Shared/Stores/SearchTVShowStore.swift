//
//  SearchTVShowStore.swift
//  EberryTVApp
//
//  Created by Mohamed Diaa on 2019-10-27.
//  Copyright © 2019 Mohamed Diaa. All rights reserved.
//

import Foundation

class SearchTVShowStore {
    
    static let apiURL = "http://api.tvmaze.com/search/shows"
    
    func search(query: String, completion: @escaping(_ tvShows: TVShows?, _ error: Error?)->()) {
        
        let session = URLSession.shared
        guard let url = URL(string: "\(SearchTVShowStore.apiURL)?q=\(query)")
            else { return }
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            
            guard let jsonData = data
                else { return }
            
            do {
                let tvShows = try JSONDecoder().decode(TVShows.self, from: jsonData)
                completion(tvShows, error)
            }
            catch(let parsingError) {
                completion(nil, parsingError)
            }
        })
        
        task.resume()
    }
}
