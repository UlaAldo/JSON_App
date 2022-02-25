//
//  NetworkManager.swift
//  JSON_App
//
//  Created by Юлия Алдохина on 24/02/22.
//

import Foundation

//class NetworkManager {
//    
//    static let sample = NetworkManager()
//    
//    private func fetchComics() {
//        guard let url = URL(string: Link.json.rawValue) else { return }
//        
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else {
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//            
//            do {
//                let comic = try JSONDecoder().decode([Comic].self, from: data)
//                DispatchQueue.main.async {
//                    
//                }
//            } catch let error {
//                print(error.localizedDescription)
//            }
//            
//        }.resume()
//    }
//    
//}
