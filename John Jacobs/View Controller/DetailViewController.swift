//
//  DetailViewController.swift
//  John Jacobs
//
//  Created by Shreyansh Raj Keshri on 19/02/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let data = movie {
            configureUI(data: data)
        }
                
    }
    
    func configureUI(data: Movie) {
        movie = data

        titleLabel.text = data.movieList?.title
        subTitleLabel.text = data.movieList?.overview
        popularityLabel.text = "popularity : \(data.movieList?.popularity ?? 1)"
        releaseDateLabel.text = "Release Date : \(data.movieList?.releaseDate ?? "2022-01-01")"
        
        if let posterPath =  data.movieList?.posterPath {
            let imageUrl = "https://image.tmdb.org/t/p/original" + posterPath
            posterImageView.sd_setImage(with: URL(string: imageUrl.replacingOccurrences(of: "amp;", with: "")))
        }
        
        if data.favourite {
            favButton.setImage(UIImage(named: "FavSelected"), for: .normal)
        } else {
            favButton.setImage(UIImage(named: "FavUnselected"), for: .normal)
        }
    }
    
    @IBAction func watchButtonAction(_ sender: UIButton) {
        
    }
    
    @IBAction func favButtonAction(_ sender: UIButton) {
        favButton.setImage(UIImage(named: "FavSelected"), for: .normal)

        if let data = movie?.movieList {
            DataManager.shared.updateFavourite(of: data)
        }
    }
}
