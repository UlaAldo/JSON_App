//
//  ViewController.swift
//  JSON_App
//
//  Created by Юлия Алдохина on 24/02/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var altLabel: UILabel!
    @IBOutlet var comicImageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
    var comic: Comic!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
    }
    
    private func fetchImage() {
        altLabel.text = comic.alt
        descriptionLabel.text = """
    Title: \(comic.title)
    Number: \(comic.num)
    Month: \(comic.month)
    Year: \(comic.year)
    """
        DispatchQueue.global().async {
            guard let url = URL(string: self.comic.img) else {return}
            guard let imgData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.comicImageView.image = UIImage(data: imgData)
            }
        }
    }
}
