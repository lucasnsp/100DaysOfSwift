//
//  ViewController.swift
//  NotesApp
//
//  Created by Lucas Neves dos santos pompeu on 05/07/23.
//

import UIKit

class ViewController: UITableViewController{
    
    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!
    
    var models: [(title: String, note: String)] = []
    
    override func viewDidLoad() {
        table.delegate = self
        table.dataSource = self
        title = "Notes"
        
    }
    
    @IBAction func didTapNewNote() {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].title
        cell.detailTextLabel?.text = models[indexPath.row].note
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "note") as? NoteViewController else { return }
        
        vc.title = "Note"
        navigationController?.pushViewController(vc, animated: true)
    }
}

