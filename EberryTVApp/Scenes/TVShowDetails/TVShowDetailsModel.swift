//
//  TVShowDetailsModel.swift
//  EberryTVApp
//
//  Created by Mohamed Diaa on 2019-10-27.
//  Copyright © 2019 Mohamed Diaa. All rights reserved.
//

import Foundation

struct TVShowDetails {
    
    struct LoadShow {
        struct Request {
            
        }
        struct Response {
            var tvShow: TVShow?
        }
        struct ViewModel {
            var tvShow: TVShow?
        }
    }
}
