//
//  SearchTVShowRouter.swift
//  EberryTVApp
//
//  Created by Mohamed Diaa on 2019-10-27.
//  Copyright © 2019 Mohamed Diaa. All rights reserved.
//

import UIKit

protocol SearchTVShowRoutingLogic {
 
    func routeToTVShowDetails()
}

class SearchTVShowRouter: SearchTVShowRoutingLogic {
    
    weak var viewController: SearchTVShowViewController?
    
    func routeToTVShowDetails() {
        
        let storyboard = UIStoryboard(name: String(describing: TVShowDetails.self), bundle: nil)
             guard let vc = storyboard.instantiateInitialViewController()
                 else { return }
             

        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
