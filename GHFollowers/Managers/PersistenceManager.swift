//
//  PersistenceManager.swift
//  GHFollowers
//
//  Created by Aruuke Turgunbaeva on 27/3/24.
//

import Foundation

enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }

    static func retrieveFavorites(completed: @escaping (Result<[Follower], GFErrorMessage>) -> Void) {
        guard let favoritesData = defaults.data(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
        
    }
}
