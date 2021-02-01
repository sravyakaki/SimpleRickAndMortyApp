//
//  CharacterDataSource.swift
//  RickAndMortyAPIApp
//
//  Created by Sravya Kaki on 1/31/21.
//  Copyright © 2021 Sravya Kaki. All rights reserved.
//


import UIKit

class CharacterDataSource: NSObject, UICollectionViewDataSource {
    
    var photos = [Character]()
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier = "CharacterCollectionViewCell"
        let cell =
            collectionView.dequeueReusableCell(withReuseIdentifier: identifier,
                                               for: indexPath) as! CharacterCollectionViewCell
        cell.update(displaying: nil)
        
        return cell
    }
}
