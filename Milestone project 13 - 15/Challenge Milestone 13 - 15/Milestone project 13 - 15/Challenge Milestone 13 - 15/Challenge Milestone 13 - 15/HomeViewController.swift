//
//  TableViewController.swift
//  Challenge Milestone 13 - 15
//
//  Created by Lucas Neves dos santos pompeu on 17/06/23.
//

import UIKit

final class HomeViewController: UITableViewController {
    
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Country Facts"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        DispatchQueue.global().async {
            self.fetchJSON("https://restcountries.com/v3.1/all")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "factCell", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].name.official
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCountry = countries[indexPath.row]
        let vc = DetailViewController()
        vc.selectedCountry = selectedCountry
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension HomeViewController {
    
    @objc func fetchJSON(_ urlString:String) {
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
                return
            }
        }
        performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
    }
    
    func parse(json:Data) {
        let decoder = JSONDecoder()

        if let jsonCountries = try? decoder.decode(Countries.self, from: json) {
            countries = jsonCountries.sorted { $0.name.official < $1.name.official }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } else {
            performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
        }
    }
    
    @objc func showError() {
        let ac = UIAlertController(title: "Loading Error", message: "Please, check your connection", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(ac, animated: true)
    }
    
}
