//
//  SearchTVShowPresenter.swift
//  EberryTVApp
//
//  Created by Mohamed Diaa on 2019-10-27.
//  Copyright © 2019 Mohamed Diaa. All rights reserved.
//

import Foundation

protocol SearchTVShowPresentationLogic: class {
 
    func presentSearchTVShow(response: SearchTVShow.SearchTVShow.Response)
    func presentSelectTVShowDetails(response: SearchTVShow.SelectTVShowDetails.Response)
}

class SearchTVShowPresenter: SearchTVShowPresentationLogic {
    
    weak var view: SearchTVShowDisplayLogic?
    
    func presentSearchTVShow(response: SearchTVShow.SearchTVShow.Response) {
        
        let viewModel =  SearchTVShow.SearchTVShow.ViewModel(tvShows: response.tvShows)
        view?.displaySearchTVShow(viewModel: viewModel)
    }
    
    func presentSelectTVShowDetails(response: SearchTVShow.SelectTVShowDetails.Response) {
        let viewModel = SearchTVShow.SelectTVShowDetails.ViewModel()
        view?.displaySelectTVShowDetails(viewModel: viewModel)
    }
}
