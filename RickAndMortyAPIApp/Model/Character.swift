//
//  Character.swift
//  RickAndMortyAPIApp
//
//  Created by Sravya Kaki on 1/31/21.
//  Copyright © 2021 Sravya Kaki. All rights reserved.
//

import Foundation

class Character: Codable {
    let remoteURL: URL?
    let photoID: String
    
    enum CodingKeys: String, CodingKey {
        case remoteURL = "image"
        case photoID = "name"
    }
}

extension Character: Equatable {
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.photoID == rhs.photoID
    }
    
}

