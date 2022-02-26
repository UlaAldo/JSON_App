//
//  AllCommicsTableViewController.swift
//  JSON_App
//
//  Created by Юлия Алдохина on 25/02/22.
//

import UIKit

class AllComicsTableViewController: UITableViewController {
    
    var comics: [Comic] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        NetworkManager.sample.fetchComics { comic in
            self.comics.append(comic)
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comics.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ComicCell
        let comic = comics[indexPath.row]
        cell.configure(with: comic)
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let detailsVC = segue.destination as? DetailsViewController else { return }
            detailsVC.comic = comics[indexPath.row]
        }
    }
}
