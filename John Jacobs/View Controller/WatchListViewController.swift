//
//  WatchListViewController.swift
//  John Jacobs
//
//  Created by Shreyansh Raj Keshri on 19/02/22.
//

import UIKit

class WatchListViewController: UIViewController {

    @IBOutlet weak var watchlistTableView: UITableView!
    
    var movie: [Movie]?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerTableView()
    }
    
    private func registerTableView() {
        watchlistTableView.delegate = self
        watchlistTableView.dataSource = self
        
        let cellNib = UINib(nibName: "MovieListTableViewCell", bundle: nil)
        watchlistTableView.register(cellNib, forCellReuseIdentifier: "MovieListTableViewCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let movieItems = DataManager.shared.movie {
            movie = movieItems.filter({ movie in
                movie.favourite == true
            })
        }
        watchlistTableView.reloadData()
    }
}


//MARK: - Extension TableView
extension WatchListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = watchlistTableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell") as! MovieListTableViewCell
        if let data = movie?[indexPath.row] {
            cell.configureUI(data: data)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        if let data = movie?[indexPath.row] {
            detailViewController.movie = data
        }

        self.present(detailViewController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

