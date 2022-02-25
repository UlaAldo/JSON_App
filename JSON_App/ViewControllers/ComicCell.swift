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
        DispatchQueue.global().async {
            guard let url = URL(string: comic.img) else {return}
            guard let imgData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.comicImage.image = UIImage(data: imgData)
        }
    }
}
}
