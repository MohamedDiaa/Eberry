//
//  SearchTVShowViewController.swift
//  EberryTVApp
//
//  Created by Mohamed Diaa on 2019-10-27.
//  Copyright © 2019 Mohamed Diaa. All rights reserved.
//

import UIKit

protocol SearchTVShowDisplayLogic: class {
    
    func displaySearchTVShow(viewModel: SearchTVShow.SearchTVShow.ViewModel)
}

class SearchTVShowViewController: UITableViewController, SearchTVShowDisplayLogic, UISearchBarDelegate{

    var interactor: SearchTVShowBusinessLogic?
    var router: SearchTVShowRoutingLogic?
    
    var tvShows: TVShows?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }
    
    func setup() {
        let view = self
        let interactor = SearchTVShowInteractor()
        let presenter = SearchTVShowPresenter()
        let router = SearchTVShowRouter()
        
        view.interactor = interactor
        view.router = router
        
        interactor.presenter = presenter
        
        presenter.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    func displaySearchTVShow(viewModel: SearchTVShow.SearchTVShow.ViewModel) {
            
        self.tvShows = viewModel.tvShows
        tableView.reloadData()
        
        print(tvShows)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        guard tvShows != nil
            else { return 0 }
        return  0 //1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  0 //tvShows?.count ?? 0
    }

    
    // MARK: - Search bar textDidChange delegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        loadQuery(query: searchBar.text)
    }

    func loadQuery(query: String?) {
        
        let request = SearchTVShow.SearchTVShow.Request(query: query)
        interactor?.searchTVShow(request: request)
    }
}
