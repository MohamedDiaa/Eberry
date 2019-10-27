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
    func selectTVShowDetails(request: SearchTVShow.SelectTVShowDetails.Request)
}

protocol SearchTVShowDataStore: class {

    var selectedTVShow: TVShow? { get set }
}

class SearchTVShowInteractor: SearchTVShowBusinessLogic, SearchTVShowDataStore {
    
    var presenter: SearchTVShowPresentationLogic?
    var worker = SearchTVShowWorker()
    var selectedTVShow: TVShow?
    
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
    
    func selectTVShowDetails(request: SearchTVShow.SelectTVShowDetails.Request) {
        
        self.selectedTVShow = request.selectedTVShow
        let response = SearchTVShow.SelectTVShowDetails.Response()
        self.presenter?.presentSelectTVShowDetails(response: response)
    }
}
