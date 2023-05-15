//
//  ViewController.swift
//  Milestone 4-6 Shopping List
//
//  Created by Lucas Neves dos santos pompeu on 15/05/23.
//

import UIKit

class ViewController: UITableViewController {
    
    var shoppingList: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(listItems))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(listAdd))
        
        title = "Shopping List"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
    }
    
    @objc func listAdd() {
        shoppingList.removeAll(keepingCapacity: true)
               
        tableView.reloadData()
    }
    
    @objc func listItems() {
        let ac = UIAlertController(title: "New shopping item", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let addAction = UIAlertAction(title: "Add", style: .default) {
            [weak self, weak ac] _ in
            guard let item = ac?.textFields?[0].text else {
                return
            }
            
            self?.addItem(item: item)
        }
        ac.addAction(addAction)
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(ac, animated: true)
    }
    
    func addItem(item: String) {
        if itemAlreadyPresent(item: item) {
            let ac = UIAlertController(title: "Item present", message: "\"\(item)\" is already on your shopping list", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
        
        shoppingList.insert(item, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    func itemAlreadyPresent(item: String) -> Bool {
        return shoppingList.contains(where: {
            $0.compare(item, options: .caseInsensitive) == .orderedSame})
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection Section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "List", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            shoppingList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

}

