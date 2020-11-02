//
//  DetailViewController.swift
//  PokeDex2020
//
//  Created by Field Employee on 11/1/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var movesLabel: UILabel!
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var elementsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var image = UIImage()
    var name = ""
    var moves = ""
    var index = ""
    var elements = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = name
        imageView.image = image
        movesLabel.text = moves
        indexLabel.text = index
        elementsLabel.text = elements
        
    }
    
    
}


