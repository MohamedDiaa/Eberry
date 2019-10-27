//
//  ViewController.swift
//  EberryTVApp
//
//  Created by Mohamed Diaa on 2019-10-27.
//  Copyright © 2019 Mohamed Diaa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let storyboard = UIStoryboard(name: String(describing: SearchTVShow.self), bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController()
            else { return }
        
        present(vc, animated: true, completion: nil)
        
    }
    
}

