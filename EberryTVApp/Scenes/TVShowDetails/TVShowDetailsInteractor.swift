//
//  TVShowDetailsInteractor.swift
//  EberryTVApp
//
//  Created by Mohamed Diaa on 2019-10-27.
//  Copyright © 2019 Mohamed Diaa. All rights reserved.
//

import Foundation

protocol TVShowDetailsBusinessLogic: class {
    
    func loadShow(request: TVShowDetails.LoadShow.Request)
}

protocol TVShowDetailsDataStore: class {
    
    var tvShow: TVShow? { get set }
}

class TVShowDetailsInteractor: TVShowDetailsBusinessLogic, TVShowDetailsDataStore {
    
    var presenter: TVShowDetailsPresentationLogic?
    var tvShow: TVShow?

    func loadShow(request: TVShowDetails.LoadShow.Request) {
        let response = TVShowDetails.LoadShow.Response(tvShow: tvShow)
        presenter?.presentLoadShow(response: response)
    }
}
