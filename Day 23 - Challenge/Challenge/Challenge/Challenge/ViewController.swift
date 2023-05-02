//
//  ViewController.swift
//  Challenge
//
//  Created by Lucas Neves dos santos pompeu on 01/05/23.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        title = "Flag Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("png") {
                pictures.append(item)
            }
            
            pictures.sort()
        }
       
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        cell.imageView?.image = UIImage(named: pictures[indexPath.row])
        let flagName = pictures[indexPath.row].filename().uppercased()
        cell.textLabel?.text = flagName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            let flagName = pictures[indexPath.row].filename().uppercased()
            vc.title = "\(flagName)"
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension String {
    func filename() -> String {
        return NSURL(fileURLWithPath: self).deletingPathExtension?.lastPathComponent ?? ""
    }
    func fileExtension() -> String {
        return NSURL(fileURLWithPath: self).pathExtension ?? ""
    }
}
