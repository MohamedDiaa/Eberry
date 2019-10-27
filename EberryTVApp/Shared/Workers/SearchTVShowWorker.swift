//
//  SearchTVShowWorker.swift
//  EberryTVApp
//
//  Created by Mohamed Diaa on 2019-10-27.
//  Copyright © 2019 Mohamed Diaa. All rights reserved.
//

import Foundation

protocol SearchTVShowStoreProtocol {
    
     func search(query: String, completion: @escaping(_ tvShows: TVShows?, _ error: Error?)->()) 
}

class SearchTVShowWorker {
    
    var store: SearchTVShowStoreProtocol
    
    init(store: SearchTVShowStoreProtocol = SearchTVShowAPIStore()) {
        self.store = store
    }
    
    func search(query: String, completion: @escaping(_ tvShows: TVShows?, _ error: Error?)->()){
        
        store.search(query: query, completion: completion)
    }
}
