//
//  TVShowDetailsViewController.swift
//  EberryTVApp
//
//  Created by Mohamed Diaa on 2019-10-27.
//  Copyright © 2019 Mohamed Diaa. All rights reserved.
//

import UIKit

protocol TVShowDetailsDisplayLogic: class {
    
    func displayLoadShow(viewModel: TVShowDetails.LoadShow.ViewModel)
}

class TVShowDetailsViewController: UITableViewController, TVShowDetailsDisplayLogic {
    
    var interactor: TVShowDetailsBusinessLogic?
    var router: (TVShowDetailsRoutingLogic & TVShowDetailsDataPassing)?
    
    var tvShow: TVShow?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }
    
    func setup() {
        let view = self
        let interactor = TVShowDetailsInteractor()
        let presenter = TVShowDetailsPresenter()
        let router = TVShowDetailsRouter()
        
        view.interactor = interactor
        view.router = router
        
        interactor.presenter = presenter
        
        presenter.view = view
        
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        loadData()
    }
    
    func setupAppearance(){
        
        let nib = UINib(nibName: String(describing: TVShowCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: TVShowCell.self))
    }
    
    func loadData() {
        let request = TVShowDetails.LoadShow.Request()
        interactor?.loadShow(request: request)
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard tvShow != nil
            else { return 0 }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard tvShow != nil
            else { return 0 }
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TVShowCell.self)) as? TVShowCell
            else { return TVShowCell() }
        
        guard let tvShow = self.tvShow
            else { return cell }
        
        cell.showLabel.text = tvShow.show?.name
        cell.showDesc.text = tvShow.show?.genres?.compactMap{ $0 }.joined(separator: ",")
        cell.setImageFromUrl(imageURL: tvShow.show?.image?.medium)

        
        return cell
    }
    
    
    func displayLoadShow(viewModel: TVShowDetails.LoadShow.ViewModel) {
        self.tvShow = viewModel.tvShow
        tableView.reloadData()
    }
}
