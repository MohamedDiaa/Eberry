//
//  SearchTVShowStore.swift
//  EberryTVApp
//
//  Created by Mohamed Diaa on 2019-10-27.
//  Copyright © 2019 Mohamed Diaa. All rights reserved.
//

import Foundation

class SearchTVShowStore {
    
    func search(q: String?) {
        
        
        let session = URLSession.shared
        let url = URL(string: "https://learnappmaking.com/ex/users.json")!

        let task = session.dataTask(with: url, completionHandler: { data, response, error in

            // Do something...
        })

        task.resume()
    }
}
