//
//  ViewController.swift
//  NetworkingAbstractionMoya
//
//  Created by Cahyanto Setya Budi on 11/12/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var networkProvider: NetworkManager!
    
    init(networkProvider: NetworkManager) {
        self.networkProvider = networkProvider
        super.init(nibName: nil, bundle: nil)


    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.green
        networkProvider.getNewMovies(page: 1) { (movies) in
            print(movies)
        }
    }

}

