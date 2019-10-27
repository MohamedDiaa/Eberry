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
    func displaySelectTVShowDetails(viewModel: SearchTVShow.SelectTVShowDetails.ViewModel)
}

class SearchTVShowViewController: UITableViewController, SearchTVShowDisplayLogic, UISearchBarDelegate{
    
    var interactor: SearchTVShowBusinessLogic?
    var router: (SearchTVShowRoutingLogic & SearchTVShowDataPassing)?
    
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
        
        router.viewController = view
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
    }
    
    func setupAppearance(){
        
        let nib = UINib(nibName: String(describing: TVShowCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: TVShowCell.self))
    }
    
    func displaySearchTVShow(viewModel: SearchTVShow.SearchTVShow.ViewModel) {
        
        self.tvShows = viewModel.tvShows
        tableView.reloadData()
    }
    
    func displaySelectTVShowDetails(viewModel: SearchTVShow.SelectTVShowDetails.ViewModel) {
     
        router?.routeToTVShowDetails()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard tvShows != nil
            else { return 0 }
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tvShows?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TVShowCell.self)) as? TVShowCell
            else { return TVShowCell() }
        
        guard let tvShows = self.tvShows, tvShows.count > indexPath.row
            else { return cell }
        
        cell.showLabel.text = tvShows[indexPath.row].show?.name
        cell.showDesc.text = tvShows[indexPath.row].show?.genres?.compactMap{ $0 }.joined(separator: ",")
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let tvShows = self.tvShows, tvShows.count > indexPath.row
            else { return }
        loadSelection(tvShow: tvShows[indexPath.row])
    }
    
    func loadSelection(tvShow: TVShow) {
        
        let request = SearchTVShow.SelectTVShowDetails.Request(selectedTVShow: tvShow)
        interactor?.selectTVShowDetails(request: request)
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
