//
//  ViewController.swift
//  Project 1
//
//  Created by Lucas Neves dos santos pompeu on 19/04/23.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    var picturesViewCount = [String: Int]()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
       
        performSelector(inBackground: #selector(loadPictures), with: nil)
        
        let userDefaults = UserDefaults.standard
        picturesViewCount = userDefaults.object(forKey: "ViewCount") as? [String: Int] ?? [String: Int]()
    }
    
    @objc func loadPictures() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
            for item in items {
                if item.hasPrefix("nssl") {
                    // this is a picture to load!
                    self.pictures.append(item)
                }
        }
        pictures.sort()
        
        print(pictures)
        
        tableView.performSelector(onMainThread: #selector(tableView.reloadData), with: nil, waitUntilDone: false)
    }

    override func tableView(_ tableview: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.x = indexPath.row + 1
            vc.y = pictures.count
            picturesViewCount[pictures[indexPath.row], default: 0] += 1
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

