//
//  File.swift
//  JSON_App
//
//  Created by Юлия Алдохина on 24/02/22.
//

import Foundation

struct Comic: Decodable {
    let month: String?
    let num: Int?
    let year: String?
    let alt: String?
    let img: String?
    let title: String?
    
    init(comicData: [String: Any]) {
        month = comicData["month"] as? String
        num = comicData["num"] as? Int
        year = comicData["year"] as? String
        alt = comicData["alt"] as? String
        img = comicData["img"] as? String
        title = comicData["title"] as? String
    }
    
    static func getComic(from value: Any) -> Comic {
        guard let comicData = value as? [String: Any] else { return Comic(comicData: [:]) }
        let comic = Comic(comicData: comicData)
        return comic
    }
}



