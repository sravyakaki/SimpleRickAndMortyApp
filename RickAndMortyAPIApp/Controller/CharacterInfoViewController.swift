//
//  CharacterInfoViewController.swift
//  RickAndMortyAPIApp
//
//  Created by Sravya Kaki on 1/31/21.
//  Copyright © 2021 Sravya Kaki. All rights reserved.
//

import UIKit

class CharacterInfoViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var characterImage: Character! {
        didSet {
            navigationItem.title = characterImage.photoID
        }
    }
    var store: CharacterImageSore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchImage(for: characterImage) {
            (result) in
            switch result {
            case let .success(image):
                self.imageView.image = image
            case let .failure(error):
                print("Error fetching image for photo: \(error)")
            }
        }
    }
    
}
