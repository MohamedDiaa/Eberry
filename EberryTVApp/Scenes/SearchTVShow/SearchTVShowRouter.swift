//
//  SearchTVShowRouter.swift
//  EberryTVApp
//
//  Created by Mohamed Diaa on 2019-10-27.
//  Copyright © 2019 Mohamed Diaa. All rights reserved.
//

import UIKit

protocol SearchTVShowRoutingLogic: class {
 
    func routeToTVShowDetails()
}

protocol SearchTVShowDataPassing: class{
 
    var dataStore: SearchTVShowDataStore? { get }
}

class SearchTVShowRouter: SearchTVShowRoutingLogic, SearchTVShowDataPassing {
    
    weak var viewController: SearchTVShowViewController?
    weak var dataStore: SearchTVShowDataStore?
    
    func routeToTVShowDetails() {
        
        let storyboard = UIStoryboard(name: String(describing: TVShowDetails.self), bundle: nil)
             guard let destination = storyboard.instantiateInitialViewController() as? TVShowDetailsViewController,
                let router = destination.router
                 else { return }
             
        passData(source: dataStore, destination: router.dataStore)

        viewController?.navigationController?.pushViewController(destination, animated: true)
    }
    
    func passData(source: SearchTVShowDataStore?, destination: TVShowDetailsDataStore?) {
        
        destination?.tvShow = source?.selectedTVShow
    }
}
