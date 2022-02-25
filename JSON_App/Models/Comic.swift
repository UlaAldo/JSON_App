//
//  File.swift
//  JSON_App
//
//  Created by Юлия Алдохина on 24/02/22.
//

import Foundation

struct Comic: Decodable {
    let month: String
    let num: Int
    let year: String
    let alt: String
    let img: String
    let title: String
}

enum Link: String {
    case json = "https://xkcd.com/2/info.0.json"
}


