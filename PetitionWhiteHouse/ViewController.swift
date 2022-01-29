//
//  ViewController.swift
//  PetitionWhiteHouse
//
//  Created by Andres Gutierrez on 1/28/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var petitions   = [Petitions]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString: String
        
        if navigationController?.tabBarItem.tag == 0 {
             urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
             urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url){
                parseJson(json: data)
                return
            }
        }
            showAlert()
        
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Something went wrong..", message: "Error navigating to URL. Please check internet connection and try again.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alertController, animated: true)
    }
    
    func parseJson(json: Data){
        let decoder = JSONDecoder()
        
        if let jsonDecoded  = try? decoder.decode(MetaData.self, from: json){
            petitions   = jsonDecoded.results
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell    = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition                = petitions[indexPath.row]
        cell.textLabel?.text        = petition.title
        cell.detailTextLabel?.text  = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc  = DetailViewController()
        vc.detailItem   = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

