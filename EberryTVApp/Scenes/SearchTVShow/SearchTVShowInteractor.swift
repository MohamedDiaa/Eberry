//
//  SearchTVShowInteractor.swift
//  EberryTVApp
//
//  Created by Mohamed Diaa on 2019-10-27.
//  Copyright © 2019 Mohamed Diaa. All rights reserved.
//

import Foundation

protocol SearchTVShowBusinessLogic: class {
    
    func searchTVShow(request: SearchTVShow.SearchTVShow.Request)
}

class SearchTVShowInteractor: SearchTVShowBusinessLogic {
    
    var presenter: SearchTVShowPresentationLogic?
    var worker = SearchTVShowWorker()
    
    func searchTVShow(request: SearchTVShow.SearchTVShow.Request) {
        
        guard let query = request.query
            else { return }
        
        worker.search(query: query) {[weak self] (tvshows, error) in
            
            DispatchQueue.main.async {
                let response = SearchTVShow.SearchTVShow.Response(tvShows: tvshows)
                self?.presenter?.presentSearchTVShow(response: response)
            }
        }
    }
}
