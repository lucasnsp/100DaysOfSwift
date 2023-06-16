//
//  ViewController.swift
//  Challenge Milestone 13 - 15
//
//  Created by Lucas Neves dos santos pompeu on 16/06/23.
//

import UIKit

class ViewController: UITableViewController {
    var countries: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Country Facts"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func fetchCountries() {
           let joinedCodes = Country.countryCodes.joined(separator: ",")
           
           guard let url = URL(string: "https://restcountries.com/v3.1/alpha?codes=\(joinedCodes)") else {
               fatalError("Invalid URL provided for countries.")
           }
           
           let task = URLSession.shared.dataTask(with: url) { data, _, error in
               guard error == nil else {
                   print(error!.localizedDescription)
                   return
               }
               
               if let data = data {
                   do {
                       self.countries = try JSONDecoder().decode([Country].self, from: data)
                       
                       DispatchQueue.main.async {
                           self.countries.sort { $0.name.common < $1.name.common }
                           
                           self.tableView.reloadData()
                       }
                   } catch {
                       print(error.localizedDescription)
                   }
               }
           }
           
           task.resume()
       }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = countries[indexPath.row]
        
        if let detailVC = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            detailVC.country = country
            
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
}

