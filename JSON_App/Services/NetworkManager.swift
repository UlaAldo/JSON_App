//
//  NetworkManager.swift
//  JSON_App
//
//  Created by Юлия Алдохина on 24/02/22.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let sample = NetworkManager()
    
    private init() {}
    
    func fetchDataWithAlamofire(completion: @escaping(Result<Comic, NetworkError>) -> Void) {
        for index in 1...15 {
            AF.request("https://xkcd.com/\(index)/info.0.json")
                .validate()
                .responseJSON { dataResponse in
                    switch dataResponse.result {
                    case .success(let value):
                        let comic = Comic.getComic(from: value)
                        DispatchQueue.main.async {
                            completion(.success(comic))
                        }
                    case .failure:
                        completion(.failure(.decodingError))
                    }
                }
        }
    }
    
    func fetchImage(from url: String?, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: url ?? "") else {
            completion(.failure(.invalidURL))
            return
        }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else {
                completion(.failure(.noData))
                return
            }
            DispatchQueue.main.async {
                completion(.success(imageData))
            }
        }
    }
    
    enum NetworkError: Error {
        case invalidURL
        case noData
        case decodingError
    }
    
}


