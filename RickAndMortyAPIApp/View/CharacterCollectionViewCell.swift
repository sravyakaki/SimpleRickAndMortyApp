//
//  CharacterViewCell.swift
//  RickAndMortyAPIApp
//
//  Created by Sravya Kaki on 1/31/21.
//  Copyright © 2021 Sravya Kaki. All rights reserved.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var spinner: UIActivityIndicatorView!
    @IBOutlet var imageView: UIImageView!
    
    func update(displaying image: UIImage?){
        if let imageToDisplay = image {
            spinner.stopAnimating()
            imageView.image = imageToDisplay
        } else {
            spinner.startAnimating()
            imageView.image = nil
        }
    }
    
}

