//
//  TVShowDetailsRouter.swift
//  EberryTVApp
//
//  Created by Mohamed Diaa on 2019-10-27.
//  Copyright © 2019 Mohamed Diaa. All rights reserved.
//

import Foundation

protocol TVShowDetailsRoutingLogic {
    
}

protocol TVShowDetailsDataPassing {
    
    var dataStore: TVShowDetailsDataStore? { get }
}

class TVShowDetailsRouter: TVShowDetailsRoutingLogic, TVShowDetailsDataPassing {
    
    weak var dataStore: TVShowDetailsDataStore?
    
}
