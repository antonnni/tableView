//
//  ViewController.swift
//  cartoonTableView
//
//  Created by Anton Ni on 30/10/23.
//

import UIKit

class ViewController: UIViewController {

    var movie = Movie()
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var imageMain: UIImageView!
    @IBOutlet weak var labelLike: UILabel!
    
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelDirector: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelName.text = movie.name
        labelLike.text = movie.like
        labelDirector.text = movie.director
        labelDescription.text = movie.description
        imageMain.image = UIImage(named: movie.imagename)
        
    }


}

