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

class SearchTVShowViewController: UITableViewController, SearchTVShowDisplayLogic{

    var interactor: SearchTVShowBusinessLogic?
    var router: SearchTVShowRoutingLogic?
    
    var tvShows: TVShows?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
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

    
    

}
