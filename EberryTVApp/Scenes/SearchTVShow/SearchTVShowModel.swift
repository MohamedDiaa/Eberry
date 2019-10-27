//
//  SearchTVShowModel.swift
//  EberryTVApp
//
//  Created by Mohamed Diaa on 2019-10-27.
//  Copyright © 2019 Mohamed Diaa. All rights reserved.
//

import Foundation

struct SearchTVShow{
    
    struct SearchTVShow {
        struct Request {
            var query: String?
        }
        
        struct Response {
            var tvShows: TVShows?
        }
        struct ViewModel {
            var tvShows: TVShows?
        }
    }
    
    struct SelectTVShowDetails{
        
        struct Request {
            var selectedTVShow: TVShow?
        }
        
        struct Response {
        }
        struct ViewModel {
        }
    }
}
