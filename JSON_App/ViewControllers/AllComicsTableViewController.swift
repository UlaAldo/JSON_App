//
//  AllCommicsTableViewController.swift
//  JSON_App
//
//  Created by Юлия Алдохина on 25/02/22.
//

import UIKit

class AllComicsTableViewController: UITableViewController {
    
    private var comics: [Comic] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        fetchComics()

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
    

    private func fetchComics() {
        guard let url = URL(string: Link.json.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                self.comics = try JSONDecoder().decode([Comic].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
   /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
