//
//  RickAndMortyAPI.swift
//  RickAndMortyAPIApp
//
//  Created by Sravya Kaki on 2/1/21.
//  Copyright © 2021 Sravya Kaki. All rights reserved.
//

import Foundation

struct CharacterResponse: Codable {
    let photos: [Character]
    
    enum CodingKeys: String, CodingKey {
        case photos = "results"
    }
}

struct RickAndMortyAPI {
    
    private static let baseURLString = "https://rickandmortyapi.com/api/character"
    
    private static func flickrURL() -> URL {
        
        let components = URLComponents(string: baseURLString)!
        
        return components.url!
    }
    
    
    static var interestingPhotosURL: URL {
        return flickrURL()
    }
    
    static func photos(fromJSON data: Data) -> Result<[Character], Error> {
        do {
            let decoder = JSONDecoder()
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
            let flickrResponse = try decoder.decode(CharacterResponse.self, from: data)
            let photos = flickrResponse.photos.filter { $0.remoteURL != nil }
            
            return .success(photos)
        } catch let error {
            return .failure(error)
        }
    }
    
}
