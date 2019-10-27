//
//  TVShowDetailsViewController.swift
//  EberryTVApp
//
//  Created by Mohamed Diaa on 2019-10-27.
//  Copyright © 2019 Mohamed Diaa. All rights reserved.
//

import UIKit

protocol TVShowDetailsDisplayLogic: class {
    
}
class TVShowDetailsViewController: UITableViewController, TVShowDetailsDisplayLogic {


     var interactor: TVShowDetailsBusinessLogic?
     var router: (TVShowDetailsRoutingLogic & TVShowDetailsDataPassing)?
     
     var tvShows: TVShows?
     
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
     }
     
     override func viewDidLoad() {
         super.viewDidLoad()
         setupAppearance()
     }

     func setupAppearance(){
         
         let nib = UINib(nibName: String(describing: TVShowCell.self), bundle: nil)
         tableView.register(nib, forCellReuseIdentifier: String(describing: TVShowCell.self))
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
     
     
}
