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
    Title: \(comic.title ?? "")
    Number: \(comic.num ?? 0)
    Month: \(comic.month ?? "")
    Year: \(comic.year ?? "")
    """
        NetworkManager.sample.fetchImage(from: comic.img){ result in
            switch result {
            case .success(let imageData):
                self.comicImageView.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
