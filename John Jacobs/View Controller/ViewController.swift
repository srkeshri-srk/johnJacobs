//
//  ViewController.swift
//  John Jacobs
//
//  Created by Shreyansh Raj Keshri on 17/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var movieListTableView: UITableView!
    
    var movie = [Movie()]
    var movieViewModel = MovieViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableView()
        getDataFromAPI {
            print("GET DATA SUCCESSFULLY!!...")
            
            if let movieList = self.movieViewModel.data?.movieList {
                for movie in movieList {
                    self.movie.append(Movie(data: movie))
                }
                
                DataManager.shared.movie = self.movie
                self.movieListTableView.reloadData()
            }
        }
    }
    
    private func registerTableView() {
        movieListTableView.delegate = self
        movieListTableView.dataSource = self
        
        let cellNib = UINib(nibName: "MovieListTableViewCell", bundle: nil)
        movieListTableView.register(cellNib, forCellReuseIdentifier: "MovieListTableViewCell")
    }
    
    func getDataFromAPI(completion: (() -> Void)? = nil) {
        movieViewModel.hitRequest {
            DispatchQueue.main.async {
                self.movieListTableView.reloadData()
                completion?()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        movieListTableView.reloadData()
    }
    
}


//MARK: - Extension TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.movie?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieListTableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell") as! MovieListTableViewCell
        if let data = DataManager.shared.movie?[indexPath.row] {
            cell.configureUI(data: data)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
                
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        if let data = DataManager.shared.movie?[indexPath.row] {
            detailViewController.movie = data
        }
        
        self.present(detailViewController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

