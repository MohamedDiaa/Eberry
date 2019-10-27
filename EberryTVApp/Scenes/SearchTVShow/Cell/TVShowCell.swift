//
//  TVShowCell.swift
//  EberryTVApp
//
//  Created by Mohamed Diaa on 2019-10-27.
//  Copyright © 2019 Mohamed Diaa. All rights reserved.
//

import UIKit


class TVShowCell: UITableViewCell {
    
    @IBOutlet weak var showLabel: UILabel!
    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var showDesc: UILabel!

    
    func setImageFromUrl(imageURL :String?) {
        guard let imageURL = imageURL
            else { return }
        
       URLSession.shared.dataTask( with: NSURL(string:imageURL)! as URL, completionHandler: {
          (data, response, error) -> Void in
          DispatchQueue.main.async {
             if let data = data {
                self.showImage.image = UIImage(data: data)
             }
          }
       }).resume()
    }
}
