//
//  MovieViewController.swift
//  TemplateEx
//
//  Created by 김수빈 on 2021/10/11.
//
import UIKit
import Foundation

class MovieViewController: BaseViewController {
    var movie: Movie!
    
    @IBOutlet weak var movieNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieNameLabel.text = movie.movieNm
    }
}
