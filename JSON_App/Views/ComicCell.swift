//
//  ComicTableViewCell.swift
//  JSON_App
//
//  Created by Юлия Алдохина on 25/02/22.
//

import UIKit

class ComicCell: UITableViewCell {
    
    @IBOutlet var comicImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    func configure(with comic: Comic){
        titleLabel.text = comic.title
        NetworkManager.sample.fetchImage(from: comic.img){ result in
            switch result {
            case .success(let imageData):
                self.comicImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}

