//
//  ViewController.swift
//  NetworkingAbstractionMoya
//
//  Created by Cahyanto Setya Budi on 11/12/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var networkProvider = NetworkManager()
    var movies: [Movie] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    init(networkProvider: NetworkManager) {
        self.networkProvider = networkProvider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkProvider.getNewMovies(page: 1) { (movies) in
            self.movies = movies
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        cell.textLabel?.text = movies[indexPath.row].title
        
        return cell
    }
    
    
}
