//
//  TVShowDetailsPresenter.swift
//  EberryTVApp
//
//  Created by Mohamed Diaa on 2019-10-27.
//  Copyright © 2019 Mohamed Diaa. All rights reserved.
//

import Foundation

protocol TVShowDetailsPresentationLogic {
    
    func presentLoadShow(response: TVShowDetails.LoadShow.Response)

}

class TVShowDetailsPresenter: TVShowDetailsPresentationLogic {
    
    weak var view: TVShowDetailsDisplayLogic?
    
    func presentLoadShow(response: TVShowDetails.LoadShow.Response) {
        let viewModel = TVShowDetails.LoadShow.ViewModel(tvShow: response.tvShow)
        view?.displayLoadShow(viewModel: viewModel)
    }
}
